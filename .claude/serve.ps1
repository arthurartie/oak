param([string]$Root, [int]$Port = 5178, [switch]$Independente)
# -Independente: ligado pelo atalho "Iniciar Oak.cmd". Se a porta estiver ocupada pela prévia do app,
# espera e assume sozinho quando o app desligar a prévia; assim o sistema não some.
# Servidor local do Oak.
# 1) Entrega os arquivos do app (oak.html, design system) para o navegador do Claude.
# 2) Ponte com o Claude Code desta máquina: o Estúdio pede um post ou ganchos, este servidor
#    prepara a pasta do perfil (about-me.md, voice.md e as skills de oak-ia/skills) e roda o
#    Claude Code em modo automático. O app acompanha o andamento por /api/job/<id>.
# O app pode trocar a porta quando a 5178 está ocupada; ele avisa pela variável PORT.
if ($env:PORT) { $Port = [int]$env:PORT }
$utf8 = New-Object System.Text.UTF8Encoding($false)
$IA = Join-Path $Root 'oak-ia'
$jobs = @{}
$script:claudeExe = $null

$mime = @{ '.html'='text/html; charset=utf-8'; '.css'='text/css; charset=utf-8'; '.js'='text/javascript; charset=utf-8'; '.svg'='image/svg+xml'; '.ttf'='font/ttf'; '.png'='image/png'; '.json'='application/json'; '.md'='text/markdown; charset=utf-8' }

function Find-Claude {
  if ($script:claudeExe -and (Test-Path -LiteralPath $script:claudeExe)) { return $script:claudeExe }
  $c = Get-Command claude -ErrorAction SilentlyContinue
  if ($c) { $script:claudeExe = $c.Source; return $script:claudeExe }
  # Claude Code que vem junto com o app do Claude (a pasta muda de versão a cada atualização)
  $base = Join-Path $env:LOCALAPPDATA 'Claude-Data'
  $cands = Get-ChildItem -Path $base -Filter 'claude.exe' -Recurse -Depth 5 -ErrorAction SilentlyContinue | Where-Object { $_.FullName -match '\\claude-code\\' } | Sort-Object LastWriteTime -Descending
  if ($cands) { $script:claudeExe = @($cands)[0].FullName; return $script:claudeExe }
  return $null
}
# Skills do fluxo LinkedIn. Preferência: os plugins instalados na conta do Claude (os mesmos que o Cowork usa,
# guardados pelo app em Claude-Data\...\rpm\...); se não achar, as cópias de oak-ia\skills.
$SKILLS = @('linkedin-post-structure', 'linkedin-copy', 'linkedin-anti-ai', 'viral-hook-creator')
$script:pluginsAt = [datetime]::MinValue; $script:plugins = @()
function Find-Plugins {
  if (((Get-Date) - $script:pluginsAt).TotalSeconds -lt 60) { return $script:plugins }
  $found = @{}
  $mans = Get-ChildItem -Path (Join-Path $env:LOCALAPPDATA 'Claude-Data\*\rpm\*\*\manifest.json') -ErrorAction SilentlyContinue
  foreach ($m in $mans) {
    try { $j = [IO.File]::ReadAllText($m.FullName, $utf8) | ConvertFrom-Json } catch { continue }
    foreach ($p in $j.plugins) {
      if ($SKILLS -contains $p.name -and -not $found.ContainsKey($p.name)) {
        $d = Join-Path $m.DirectoryName $p.id
        if (Test-Path -LiteralPath (Join-Path $d ('skills\' + $p.name + '\SKILL.md'))) { $found[$p.name] = $d }
      }
    }
  }
  $script:plugins = @($found.GetEnumerator() | ForEach-Object { [pscustomobject]@{ name = $_.Key; dir = $_.Value } })
  $script:pluginsAt = Get-Date
  return $script:plugins
}
function Send-Bytes($ctx, [int]$code, [string]$ct, [byte[]]$bytes) {
  $ctx.Response.StatusCode = $code
  $ctx.Response.ContentType = $ct
  $ctx.Response.Headers.Add('Cache-Control','no-store')
  $ctx.Response.ContentLength64 = $bytes.Length
  if ($ctx.Request.HttpMethod -ne 'HEAD') { $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length) }
}
function Send-Json($ctx, $obj, [int]$code = 200) {
  $json = $obj | ConvertTo-Json -Depth 6 -Compress
  Send-Bytes $ctx $code 'application/json; charset=utf-8' ($utf8.GetBytes($json))
}
function Read-Shared([string]$path) {
  if (-not (Test-Path -LiteralPath $path)) { return '' }
  $fs = New-Object IO.FileStream($path, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::ReadWrite)
  try { $sr = New-Object IO.StreamReader($fs, $utf8); return $sr.ReadToEnd() } finally { $fs.Dispose() }
}
function Skill-Names { if (Test-Path (Join-Path $IA 'skills')) { @(Get-ChildItem (Join-Path $IA 'skills') -Directory | ForEach-Object { $_.Name }) } else { @() } }

function Handle-Api($ctx, [string]$path) {
  $req = $ctx.Request
  # Só o próprio app pode usar a ponte: exige o cabeçalho X-Oak e, se houver Origin, a do próprio servidor
  $origin = $req.Headers['Origin']
  if ($req.Headers['X-Oak'] -ne '1' -or ($origin -and $origin -ne "http://localhost:$Port")) { Send-Json $ctx @{ error = 'forbidden' } 403; return }

  if ($path -eq 'api/status') {
    $exe = Find-Claude
    $ver = $null; if ($exe -and $exe -match '\\claude-code\\([^\\]+)\\') { $ver = $Matches[1] }
    $pl = @(Find-Plugins)
    if ($pl.Count -gt 0) { Send-Json $ctx @{ ok = $true; cli = [bool]$exe; version = $ver; source = 'conta'; skills = @($pl | ForEach-Object { $_.name } | Sort-Object) }; return }
    Send-Json $ctx @{ ok = $true; cli = [bool]$exe; version = $ver; source = 'projeto'; skills = @(Skill-Names) }; return
  }

  if ($path -eq 'api/job' -and $req.HttpMethod -eq 'POST') {
    $exe = Find-Claude
    if (-not $exe) { Send-Json $ctx @{ error = 'no_cli' } 503; return }
    $sr = New-Object IO.StreamReader($req.InputStream, $utf8); $body = $sr.ReadToEnd() | ConvertFrom-Json
    $pid2 = ([string]$body.pid) -replace '[^a-zA-Z0-9_-]', ''
    if (-not $pid2) { $pid2 = 'geral' }
    $dir = Join-Path $IA ('perfis\' + $pid2)
    New-Item -ItemType Directory -Force $dir | Out-Null
    $skillDir = Join-Path $dir '.claude\skills'
    $pl = @(Find-Plugins)
    $pluginArgs = ''
    if ($pl.Count -gt 0) {
      # Usa os plugins da conta, como o Cowork; tira cópias antigas para não ter skill repetida
      if (Test-Path -LiteralPath $skillDir) { Remove-Item -LiteralPath $skillDir -Recurse -Force }
      foreach ($p in $pl) { $pluginArgs += ' --plugin-dir "' + $p.dir + '"' }
    } else {
      # Reserva: "instala" as cópias do projeto na pasta do perfil, onde o Claude Code procura skills
      New-Item -ItemType Directory -Force $skillDir | Out-Null
      Get-ChildItem (Join-Path $IA 'skills') -Directory | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $skillDir -Recurse -Force }
    }
    [IO.File]::WriteAllText((Join-Path $dir 'about-me.md'), [string]$body.aboutMe, $utf8)
    [IO.File]::WriteAllText((Join-Path $dir 'voice.md'), [string]$body.voice, $utf8)
    $id = [guid]::NewGuid().ToString('N').Substring(0, 12)
    $jd = Join-Path $dir ('.jobs\' + $id)
    New-Item -ItemType Directory -Force $jd | Out-Null
    $pf = Join-Path $jd 'prompt.txt'; $of = Join-Path $jd 'out.jsonl'; $ef = Join-Path $jd 'err.txt'
    [IO.File]::WriteAllText($pf, [string]$body.prompt, $utf8)
    # Roda o Claude Code sem janela: pedido pela entrada padrão, eventos em JSON (um por linha) no arquivo de saída.
    # Ferramentas liberadas: skills, pesquisa na web e leitura. Nada de escrever arquivos ou rodar comandos.
    $cmd = '"' + $exe + '" -p --output-format stream-json --verbose --allowedTools "Skill,WebSearch,WebFetch,Read,Glob,Grep"' + $pluginArgs + ' < "' + $pf + '" > "' + $of + '" 2> "' + $ef + '"'
    $psi = New-Object Diagnostics.ProcessStartInfo
    $psi.FileName = $env:ComSpec
    $psi.Arguments = '/d /s /c "' + $cmd + '"'
    $psi.WorkingDirectory = $dir
    $psi.UseShellExecute = $false
    $psi.CreateNoWindow = $true
    $proc = [Diagnostics.Process]::Start($psi)
    $jobs[$id] = @{ proc = $proc; out = $of; err = $ef; kind = [string]$body.kind; started = Get-Date }
    Send-Json $ctx @{ id = $id }; return
  }

  if ($path -match '^api/job/([a-f0-9]+)/cancel$') {
    $j = $jobs[$Matches[1]]
    if ($j -and -not $j.proc.HasExited) { & taskkill.exe /PID $j.proc.Id /T /F | Out-Null }
    Send-Json $ctx @{ ok = $true }; return
  }

  if ($path -match '^api/job/([a-f0-9]+)$') {
    $j = $jobs[$Matches[1]]
    if (-not $j) { Send-Json $ctx @{ error = 'not_found' } 404; return }
    $done = $j.proc.HasExited
    $err = Read-Shared $j.err
    if ($err.Length -gt 2000) { $err = $err.Substring($err.Length - 2000) }
    Send-Json $ctx @{ done = $done; exit = $(if ($done) { $j.proc.ExitCode } else { $null }); out = (Read-Shared $j.out); err = $err }; return
  }

  if ($path -eq 'api/login' -and $req.HttpMethod -eq 'POST') {
    $exe = Find-Claude
    if (-not $exe) { Send-Json $ctx @{ error = 'no_cli' } 503; return }
    New-Item -ItemType Directory -Force $IA | Out-Null
    # Abre uma janela do terminal com o Claude Code para a pessoa entrar na própria conta (o login é dela)
    $msg = "Write-Host 'Conecte sua conta do Claude ao Oak: se o login nao abrir sozinho, digite /login e siga o navegador. Depois feche esta janela.' -ForegroundColor Cyan; & '" + $exe + "' '/login'"
    Start-Process -FilePath 'powershell.exe' -ArgumentList @('-NoExit', '-Command', $msg) -WorkingDirectory $IA | Out-Null
    Send-Json $ctx @{ ok = $true }; return
  }

  Send-Json $ctx @{ error = 'not_found' } 404
}

while ($true) {
  try {
    $l = New-Object System.Net.HttpListener
    $l.Prefixes.Add("http://localhost:$Port/")
    $l.Start()
    break
  } catch {
    if (-not $Independente) { throw }
    try { $l.Close() } catch {}
    Start-Sleep -Seconds 5
  }
}
Write-Host "Serving $Root on http://localhost:$Port/"
while ($l.IsListening) {
  $ctx = $l.GetContext()
  try {
    $path = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
    if ($path.StartsWith('api/')) { Handle-Api $ctx $path; continue }
    if ($path -eq '') { $path = 'oak.html' }
    # Não entrega as pastas internas (oak-ia, .claude, .git) para o navegador
    if ($path -match '^(oak-ia|\.claude|\.git)(/|$)' -or $path -match '\.\.') { Send-Bytes $ctx 404 'text/plain' ($utf8.GetBytes('not found')); continue }
    $file = Join-Path $Root $path
    if (Test-Path -LiteralPath $file -PathType Leaf) {
      $bytes = [IO.File]::ReadAllBytes($file)
      $ext = [IO.Path]::GetExtension($file).ToLower()
      $ct = $mime[$ext]; if (-not $ct) { $ct = 'application/octet-stream' }
      Send-Bytes $ctx 200 $ct $bytes
    } else { Send-Bytes $ctx 404 'text/plain' ($utf8.GetBytes('not found')) }
  } catch {
    Write-Host "Aviso: $($_.Exception.Message)"
    try { Send-Json $ctx @{ error = 'server'; message = $_.Exception.Message } 500 } catch {}
  } finally {
    try { $ctx.Response.Close() } catch {}
  }
}
