# Liga o servidor do Oak (http://localhost:5178) por fora do app do Claude, para a prévia não sumir
# quando a conversa fica parada. Chamado pelo atalho "Iniciar Oak.cmd". Se já estiver ligado, não faz nada.
$root = Split-Path -Parent $PSScriptRoot
$ja = Get-CimInstance Win32_Process -Filter "Name='powershell.exe'" | Where-Object { $_.CommandLine -match 'serve\.ps1' -and $_.CommandLine -match '-Independente' }
if ($ja) {
  Write-Host 'O servidor do Oak ja esta ligado.' -ForegroundColor Cyan
  Start-Sleep -Seconds 3
  exit
}
Start-Process -FilePath 'powershell.exe' -WindowStyle Hidden -ArgumentList @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', ('"' + (Join-Path $PSScriptRoot 'serve.ps1') + '"'), '-Root', ('"' + $root + '"'), '-Independente')
Write-Host 'Servidor do Oak ligado em http://localhost:5178 . Pode fechar esta janela.' -ForegroundColor Cyan
Start-Sleep -Seconds 3
