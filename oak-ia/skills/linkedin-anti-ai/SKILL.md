---
name: "linkedin-anti-ai"
description: "Use esta skill para revisar e humanizar qualquer texto escrito por IA destinado ao LinkedIn. Ative sempre que o usuário quiser que um post \"não pareça IA\", pedir revisão anti-slop, humanização de texto, remover padrões de IA, tornar o texto mais autêntico, ou depois da linkedin-copy. É a Etapa 3 do fluxo LinkedIn e a última etapa que mexe em palavras: preserva o layout, o formato e o framework definidos antes. Se o usuário disser \"revisa\", \"humaniza\", \"tira o ar de IA\" ou \"parece robótico\", use esta skill imediatamente.\n"
---

# LinkedIn Anti-AI: Humanização e Anti-Slop (v2)

## HIERARQUIA E LIMITES DESTA REVISÃO

- Se o projeto tiver `voice.md`, leia antes de revisar (sem pedir confirmação). A voz da pessoa vale mais que as sugestões de estilo desta skill. Exemplo: contrações como "tá" e "pra" só entram se a voz usar.
- As proibições desta skill (estruturas e palavras banidas) valem sempre, mesmo que o rascunho as tenha.
- Esta é a última etapa que mexe em palavras. Preserve:
  - o layout (blocos, linhas em branco, símbolos de lista)
  - a ordem dos blocos, o formato e o framework do briefing
  - o hook, salvo se ele tiver um padrão proibido
  - os números e fatos, exatamente como estão
- Mude frases, não estrutura. Se o problema for de estrutura, aponte e sugira voltar à `linkedin-post-structure`.

---

## REGRA FUNDAMENTAL: FILTRO SINTÁTICO

Esta regra anula qualquer padrão de escrita anterior.

### ❌ Estruturas proibidas
- **Travessões longos ou curtos** (— ou –) e hífen para separar ideias: substitua por vírgula, ponto final ou parênteses.
- **Comparativos de negação:** "Não é X... é Y", "Não se trata de X... trata-se de Y" e variações. É o maior sinal de texto de IA.
- **Construções paralelas:** "Não apenas... mas também" e "Além de X, Y também é...".
- **Frase de efeito ou moral da história no final:** aforismos do tipo "A melhor ferramenta é a coragem", "Volume sem intenção é desperdício". Troque por um fato concreto (resultado, consequência prática, próximo passo) ou corte.
- **Pares espelhados em sequência:** "Problemas viram oportunidades. Obstáculos viram inovações."

---

## LISTA NEGRA DE PALAVRAS

### Verbos
aprofundar, alavancar, potencializar, revolucionar, transformar, garantir, navegar na paisagem, abraçar, desvendar

### Adjetivos ocos
inovador, de vanguarda, disruptivo, resiliente, dinâmico, vibrante, crucial, fundamental, vital, game-changing, pivotal

### Substantivos gastos
tapeçaria, reino, testamento, jornada, ecossistema, excelência operacional

### Transições mecânicas
"No mundo acelerado de hoje", "Em conclusão", "Além disso", "Dito isto", "É importante notar que", "Não apenas... mas também", "Em resumo"

**Regra de ouro:** se você não diria a palavra numa mesa de café com um amigo inteligente, não use.

---

## TABELA DE SUBSTITUIÇÃO

| Robótico | Humano |
|----------|--------|
| "Utilizar esta ferramenta para alavancar resultados" | "Use isso para melhorar os números" |
| "É importante notar que a inovação é vital" | "Se não mudar, você fica para trás" |
| "Uma tapeçaria vibrante de ideias" | "Um monte de ideias diferentes" |
| "Aprofundar na complexidade da jornada" | "Entender de verdade o que está acontecendo" |

---

## ENGENHARIA DE RITMO

### Variação de comprimento
Alterne frases curtas e incisivas com frases longas e detalhadas. Uma frase de 30 palavras para explicar algo, seguida de uma de três. Ponto.

### Quebra da regra de três
A IA adora listar exatamente 3 itens porque soa equilibrado. Quando possível, use 2 ou 4.

### Hesitação
A IA fala em absolutos. Pessoas usam nuance: "talvez", "eu suspeito", "provavelmente", "parece que". Use com moderação e só se combinar com a voz.

---

## VOZ DO FUNDADOR (FLG)

O conteúdo não pode ser neutro. Fundadores têm opiniões.

- **Experiência real:** anedotas, erros cometidos, dados próprios que não existem em lugar nenhum. Use o que estiver no material e no `about-me.md`. Nunca invente.
- **Tangentes humanas:** pequenas observações laterais que mostram como a pessoa pensa.
- **CTAs leves:** "me conta o que você acha" em vez de "compre aqui".

---

## PROTOCOLO DE REVISÃO

1. Leia o `voice.md` e o texto inteiro.
2. Passe o filtro sintático e a lista negra. Corrija cada ocorrência.
3. Ajuste o ritmo onde houver frases do mesmo tamanho em sequência.
4. Confira o final: a última linha de conteúdo é um fato concreto? O CTA está no estilo da voz?
5. Leia em voz alta mentalmente. Se soar como manual de instruções ou comunicado de imprensa, simplifique até parecer conversa.
6. Confirme que layout, ordem dos blocos, hook e números ficaram intactos.

---

## EXEMPLOS DE TEXTO HUMANIZADO

### Opinião forte
```
Parei de contratar gente de marketing que só entrega rascunho de ChatGPT.

Percebi que esses profissionais ficaram preguiçosos. Colam textos genéricos e esperam que o público leia. Quem está do outro lado percebe na hora.

No LinkedIn, se o seu post parece robótico, o cliente vai achar que o seu serviço também é.

Prefiro um texto com erro de vírgula, escrito por quem viveu o problema.

Concorda ou estou ficando velho demais pra esse jogo?
```

### Erro e aprendizado
```
Perdi um contrato grande semana passada por um erro amador.

Tentei escalar nosso processo de vendas e esqueci de ouvir o que o cliente queria. Mandei uma proposta fria, montada em cima de um modelo pronto. O cliente percebeu o distanciamento na hora.

Usei a ferramenta para fugir da conversa e deixei dinheiro na mesa.

Desde segunda, toda proposta acima de R$ 20 mil passa por uma call de 15 minutos antes de ser escrita.
```

### Valor prático
```
Quer ranquear no Google usando IA? Para de pedir "escreva um blog post".

O segredo está no que você coloca antes do prompt. Eu chamo de Business Data Dump.

Funciona assim:
1. Pega 3 transcrições de áudios seus sobre o tema.
2. Joga no Claude e pede pra ele extrair os seus argumentos únicos.
3. Só depois pede o rascunho.

O texto sai com argumentos que nenhum modelo inventaria sozinho. Leva uns 10 minutos a mais por post.
```

---

## ENTREGA

Entregue a versão final dentro de um code block simples, com o layout intacto.

Depois do code block, liste em até 5 linhas o que foi mudado (por exemplo: "troquei o travessão do bloco 3 por ponto", "cortei a frase de efeito do final").

**Quando o post veio do fluxo completo** (há briefing na conversa): salve a versão final como markdown na pasta de trabalho do projeto, com o nome `posts/AAAA-MM-DD-slug-do-tema.md`, neste formato:

```
---
data: AAAA-MM-DD
angulo: [ângulo do briefing]
formato: [formato do briefing]
framework: [framework do briefing]
status: aprovado
fontes:
  - [Nome da fonte](link)
---

[post final]
```

Depois diga:

> Post salvo. Se quiser ajustar algo, me diz. Para um visual, chame a `linkedin-post-design`.

**Quando o texto veio avulso** (o usuário só colou um texto para revisar): entregue a versão final e a lista de mudanças, sem salvar arquivo.

---

## ORDEM DE USO NO FLUXO

1. (opcional) `niche-research`: temas e histórias da semana
2. (opcional) `viral-hook-creator`: gerar e escolher o hook
3. `linkedin-post-structure`: briefing (ângulo, formato, framework, esqueleto)
4. `linkedin-copy`: escrita na voz do projeto, já formatada para mobile
5. ✅ **linkedin-anti-ai**: revisão final de humanização (última etapa que mexe em palavras)
6. (opcional) `linkedin-post-design`: visual do post
