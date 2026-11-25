---
name: "linkedin-post-structure"
description: "Monta o briefing de um post de LinkedIn ANTES da escrita: material, pesquisa, ângulo, objetivo, formato do post e framework de escrita (PAS, AIDA, BAB, STAR, SLAY, PASTOR, 4P, APP), e entrega um esqueleto bloco a bloco para a linkedin-copy escrever. Ative sempre que o usuário quiser escrever, montar, planejar ou estruturar um post de LinkedIn, escolher formato ou framework, mencionar objetivos como \"gerar leads\", \"autoridade\", \"engajamento\", \"marca\", \"liderança de pensamento\", ou colar notas, transcrições ou ideias soltas para virar post. Também é ativada pela linkedin-copy quando não houver briefing. É a Etapa 1 do fluxo LinkedIn, antes da linkedin-copy.\n"
---

# LinkedIn Post Structure: Briefing do Post (v2)

Esta skill faz o trabalho de estrategista. Ela não escreve o post. Ela decide o que o post precisa ser e entrega um esqueleto que a `linkedin-copy` preenche.

## INÍCIO AUTOMÁTICO

Quando esta skill for ativada, vá direto ao Passo 1. Não resuma a skill, não explique o processo.

## MODO RÁPIDO

Se o usuário disser que está sem tempo, pedir para você decidir tudo ("decide tudo", "escolhe você", "sem tempo"), pule todas as caixas de pergunta deste processo. Escolha ângulo, formato e framework sozinho e mostre as escolhas no briefing, com uma linha de justificativa cada.

---

## PASSO 1: CONTEXTO (automático)

Cada projeto corresponde a uma pessoa (o próprio usuário ou um cliente de ghostwriting). O projeto em que você está define para quem é o post.

- Procure `about-me.md` e `voice.md` nos arquivos do projeto atual e leia os dois inteiros. Não peça confirmação, não pergunte para quem é o post, não comente que leu.
- Do `about-me.md`: público, pilares de conteúdo, histórias, resultados e dados próprios disponíveis.
- Do `voice.md`: formatos e CTAs que a voz usa ou evita, e a seção de ausências.
- Se o projeto tiver posts antigos, veja quais formatos a pessoa já usa e com que frequência, para variar.

Se algum dos dois arquivos não existir, avise em uma linha que a voz não foi encontrada, sugira rodar a skill `voice-builder` e pare.

## PASSO 2: MATERIAL

Se a mensagem do usuário já trouxer tema, notas, transcrição, hook da `viral-hook-creator` ou histórias da `niche-research`, use isso e vá para o Passo 3.

Se não trouxer, chame AskUserQuestion:

```json
[
  {
    "question": "De onde vem o post?",
    "header": "Material",
    "multiSelect": false,
    "options": [
      {"label": "Vou colar material bruto", "description": "Notas, transcrição de call ou áudio, bullets soltos"},
      {"label": "Tenho um tema", "description": "Digito o tema em seguida"},
      {"label": "Sugira temas", "description": "5 temas a partir dos pilares do about-me.md"}
    ]
  },
  {
    "question": "Quer usar algum post como referência de estrutura?",
    "header": "Referência",
    "multiSelect": false,
    "options": [
      {"label": "Não, só a voz", "description": "Briefing a partir do voice.md e do material"},
      {"label": "Vou colar exemplos", "description": "Posts de outros criadores para estudar a estrutura"},
      {"label": "Posts do projeto", "description": "Usar posts antigos ou de treino do projeto"}
    ]
  }
]
```

- Material bruto: espere o usuário colar e extraia a ideia central, as histórias, as falas reais e os dados que só essa pessoa tem.
- Sugira temas: proponha 5 temas com uma linha de ângulo cada, baseados nos pilares, e deixe escolher via AskUserQuestion.
- Exemplos colados: anote a estrutura (abertura, ritmo, transições, fechamento). Copie a estrutura, nunca as frases.

## PASSO 3: PESQUISA

Pesquise na web sobre o tema antes de decidir qualquer coisa:

- Dados e estatísticas que sustentem ou desafiem o tema
- Fatos surpreendentes ou contraintuitivos
- Exemplos reais e cases
- Equívocos comuns do público do `about-me.md`

Guarde cada dado com a fonte (nome e link).

**Regra de prova:** todo número que entrar no post precisa vir do material do usuário ou de uma fonte da pesquisa. Nunca invente métrica, porcentagem ou resultado.

## PASSO 4: DECISÕES (ângulo, formato, framework)

Com material e pesquisa em mãos, escolha 3 candidatos para cada decisão, usando as tabelas abaixo. Coloque primeiro o que você recomenda, marcado com "(Recomendado)". A quarta opção é sempre "Decida por você".

Chame AskUserQuestion com as três perguntas de uma vez:

```json
[
  {
    "question": "Qual ângulo?",
    "header": "Ângulo",
    "multiSelect": false,
    "options": [
      {"label": "[Ângulo 1] (Recomendado)", "description": "[Hook proposto + direção do post em uma frase]"},
      {"label": "[Ângulo 2]", "description": "[Hook proposto + direção do post em uma frase]"},
      {"label": "[Ângulo 3]", "description": "[Hook proposto + direção do post em uma frase]"},
      {"label": "Decida por você", "description": "A skill escolhe e explica no briefing"}
    ]
  },
  {
    "question": "Qual formato de post?",
    "header": "Formato",
    "multiSelect": false,
    "options": [
      {"label": "[Formato A] (Recomendado)", "description": "[Por que serve para este material, em uma frase]"},
      {"label": "[Formato B]", "description": "[Por que serve]"},
      {"label": "[Formato C]", "description": "[Por que serve]"},
      {"label": "Decida por você", "description": "A skill escolhe e explica no briefing"}
    ]
  },
  {
    "question": "Qual framework de escrita?",
    "header": "Framework",
    "multiSelect": false,
    "options": [
      {"label": "[Framework X] (Recomendado)", "description": "[Sequência + por que combina com o formato]"},
      {"label": "[Framework Y]", "description": "[Sequência + por que combina]"},
      {"label": "[Framework Z]", "description": "[Sequência + por que combina]"},
      {"label": "Decida por você", "description": "A skill escolhe e explica no briefing"}
    ]
  }
]
```

Regras:
- Preencha tudo com opções reais. Nada de texto de placeholder.
- Os 3 frameworks oferecidos precisam ser compatíveis com o formato recomendado (ver tabela de compatibilidade). Se o usuário escolher outro formato, ajuste o framework ao formato escolhido e diga isso em uma linha no briefing.
- Varie: se os posts antigos do projeto repetem muito um formato ou framework, recomende outro quando o material permitir.
- Se o usuário já trouxe um hook da `viral-hook-creator`, o ângulo já está definido. Pergunte só formato e framework.
- "Decida por você": escolha a opção recomendada e justifique em uma linha no briefing.

---

## OS 13 FORMATOS

Cada formato lista os blocos que o post precisa conter. O esqueleto do briefing sai daqui.

### Autoridade (Liderança de Pensamento)

**1. Perspectiva Contrária.** Para desafiar uma crença popular do setor.
Blocos: a crença comum, dita como o público diz | sua posição oposta, direta | observação ou experiência pessoal que sustenta a posição | consequência prática para o leitor | CTA: pergunta que convida ao debate.

**2. Baseado em Dados.** Para ganhar credibilidade com números próprios ou pesquisados.
Blocos: o que foi analisado e quantos itens | o padrão encontrado em lista escaneável (só números com fonte) | o que isso muda na prática | CTA: pergunta que leva o leitor a se comparar com os dados.

**3. Filosofia Operacional.** Para declarar como a pessoa trabalha e atrair quem pensa igual.
Blocos: a crença, em primeira pessoa | princípios na prática, cada um como "fazemos X em vez de Y" | o custo dessa escolha, admitido com honestidade | o que esse custo traz de volta, com um exemplo concreto | CTA implícito ou nenhum.

### Geração de Leads

**4. Estudo de Caso.** Quando há resultado real de cliente.
Blocos: resultado em números (com origem) | o que mudou na estratégia | as ações em lista | o que o leitor pode aplicar | CTA: no estilo do voice.md (palavra-chave só se a voz usar).

**5. Guia Como Fazer.** Para ensinar o método e mostrar domínio antes da venda.
Blocos: a promessa, específica | passos numerados e repetíveis | métrica própria que comprova o método (com origem) | CTA: pergunta sobre o próximo passo do leitor, ou "salve" se a voz usar.

**6. Produto Soft.** Para mostrar a solução sem parecer venda.
Blocos: dor do cliente, específica e quantificada | situação antes, intervenção, situação depois | o que a solução resolve, em lista | resultado em números + fala real do cliente | CTA: pergunta que identifica quem tem a mesma dor.

### Marca (Conexão Humana)

**7. História Vulnerável.** Para gerar confiança com uma quase-falha real.
Blocos: a admissão da quase-falha | o problema em detalhe + o momento de autocrítica (fala ou pensamento real) | a decisão | a ação concreta e o resultado | CTA: pergunta de comunidade sobre experiência parecida.

**8. Bastidores.** Para mostrar a cultura em ação por uma história real.
Blocos: um micro-evento do dia a dia | o que alguém da equipe fez, com detalhe | o que isso mostra sobre como a equipe trabalha, contado por mais um fato concreto | CTA: pergunta sobre a equipe do leitor.

**9. Humor Relacionável.** Para mostrar personalidade.
Blocos: situação ou diálogo engraçado do setor | o mesmo padrão em outros contextos | o que esse pedido esconde de necessidade real | como a pessoa lida com isso na prática | CTA: pergunta leve sobre situações parecidas.

### Engajamento Máximo

**10. Iniciador de Discussões.** Para gerar comentários com uma opinião defensável.
Blocos: "Opinião impopular:" + a opinião | o argumento, com a razão | a exceção (nuance) | prova pessoal | CTA em duas partes: "Estou errado?" + pergunta sobre a experiência do leitor.

**11. Complete a Frase.** Para volume de comentários com barreira mínima.
Blocos: a frase a completar | a resposta da própria pessoa | uma história curta que mostra de onde veio a resposta | CTA: "Sua vez."

**12. Teaser de Conteúdo.** Para reaproveitar um material longo (webinar, artigo, vídeo).
Blocos: o material e o que ele cobre | os principais aprendizados em lista | um item aprofundado | CTA duplo: pergunta + acesso ao material.

**13. Reconhecimento Colaborativo.** Para expandir alcance e fortalecer relações.
Blocos: agradecimento às pessoas, com o que cada uma fez de específico (com @) | o que a pessoa fez com o que recebeu, na prática | CTA: pedir que o leitor marque quem o ajudou recentemente.

### Escolha rápida de formato

```
Objetivo?
├── Autoridade
│   ├── Opinião contrária forte → 1
│   ├── Dados próprios ou pesquisados → 2
│   └── Valores e jeito de trabalhar → 3
├── Leads
│   ├── Resultado de cliente → 4
│   ├── Método para ensinar → 5
│   └── Solução sem parecer venda → 6
├── Marca
│   ├── Erro ou superação → 7
│   ├── História de equipe → 8
│   └── Personalidade e humor → 9
└── Engajamento
    ├── Opinião polêmica defensável → 10
    ├── Volume de comentários → 11
    ├── Conteúdo longo para reaproveitar → 12
    └── Ampliar rede → 13
```

---

## FRAMEWORKS DE ESCRITA

O formato define os blocos que o post precisa ter. O framework define a ordem e a lógica de persuasão com que esses blocos são escritos.

| Framework | Sequência | Melhor quando |
|-----------|-----------|---------------|
| **PAS** | Problema, Agitação, Solução | A dor é clara e o post entrega a saída |
| **AIDA** | Atenção, Interesse, Desejo, Ação | O post leva a uma ação concreta (material, conversa, inscrição) |
| **BAB** | Antes, Depois, Ponte | Há uma transformação para mostrar |
| **STAR** | Situação, Tarefa, Ação, Resultado | Case ou bastidor com resultado mensurável |
| **SLAY** | História, Lição, Conselho acionável, Você | História pessoal que vira orientação prática |
| **PASTOR** | Problema, Amplificação, História, Transformação, Oferta, Resposta | Post de venda soft com história e chamada |
| **4P** | Promessa, Imagem, Prova, Empurrão | Promessa forte que precisa de prova rápida |
| **APP** | Concordar, Prometer, Prévia | Abrir concordando com uma dor do leitor e prometer um caminho |
| **História, Tensão, Virada** | Contexto, conflito, mudança, consequência | Storytelling puro, sem estrutura de venda |

Cuidados de escrita que valem para todos:
- Lição, transformação ou conclusão sempre em forma concreta (o que mudou, o que fazer, um resultado). Nunca como moral da história ou frase de efeito.
- Agitação e amplificação com fatos e consequências reais, sem exagero.

### Compatibilidade formato x framework

| Formato | Frameworks que combinam |
|---------|-------------------------|
| 1. Perspectiva Contrária | APP, PAS, História-Tensão-Virada |
| 2. Baseado em Dados | 4P, PAS, AIDA |
| 3. Filosofia Operacional | BAB, SLAY, APP |
| 4. Estudo de Caso | STAR, BAB, PAS |
| 5. Guia Como Fazer | PAS, 4P, AIDA |
| 6. Produto Soft | PASTOR, BAB, PAS |
| 7. História Vulnerável | SLAY, História-Tensão-Virada, STAR |
| 8. Bastidores | STAR, História-Tensão-Virada, SLAY |
| 9. Humor Relacionável | História-Tensão-Virada, SLAY, APP |
| 10. Iniciador de Discussões | PAS, APP, SLAY |
| 11. Complete a Frase | SLAY, História-Tensão-Virada |
| 12. Teaser de Conteúdo | AIDA, 4P, PAS |
| 13. Reconhecimento Colaborativo | STAR, SLAY |

### Como decidir quando o usuário escolher "Decida por você"

1. O material tem uma história com começo, meio e fim? Prefira SLAY, STAR ou História-Tensão-Virada.
2. Tem um antes e depois mensurável? Prefira BAB ou STAR.
3. Tem uma dor clara e uma saída? Prefira PAS.
4. O post leva a uma ação concreta (material, conversa)? Prefira AIDA ou PASTOR.
5. Tem uma promessa forte com prova curta? Prefira 4P.
6. Abre com algo que o leitor já sente? Prefira APP.

Em empate, escolha o framework que o projeto usou menos nos posts recentes.

---

## PASSO 5: ENTREGAR O BRIEFING

Entregue o briefing neste formato:

```
BRIEFING

Ângulo: [ângulo]
Objetivo: [autoridade / leads / marca / engajamento]
Formato: [número e nome]
Framework: [nome + sequência]
Por quê: [uma linha por decisão que a skill tomou sozinha]

Hook (padrão: [nome do padrão]):
[linha 1]

[linha 2]

Esqueleto:
1. [Etapa do framework / bloco do formato]: o que precisa conter + material ou prova a usar
2. ...
3. ...

Fechamento: [que fato concreto fecha o conteúdo]
CTA: [tipo de CTA, conforme o voice.md]

Provas disponíveis:
- [dado] (fonte: [nome](link))
- [história ou fala do material]

Lacunas: [o que falta para o formato funcionar, ou "nenhuma"]
```

Regras do esqueleto:
- Cada item une uma etapa do framework a um bloco do formato. Exemplo: "Antes (BAB) / Resultado em números (Estudo de Caso): faturamento caiu 30% em 2 meses, dado do material".
- Diga o que cada bloco precisa conter, não escreva o texto final.
- Hook: se veio da `viral-hook-creator`, copie sem mudar, com o nome do padrão. Se não veio, proponha um usando um dos 12 padrões da tabela abaixo: linha 1 (hook), linha em branco, linha 2 (re-hook), cada linha com até uns 40 caracteres. Para ver 6 opções com exemplos de cada padrão, o usuário pode chamar a `viral-hook-creator`.

### Os 12 padrões de hook (resumo)

| Padrão | Estrutura | Exemplo |
|--------|-----------|---------|
| O Educativo | Como [resultado]. + formato ou condição | Como postar todos os dias. / (Sem ser genérico). |
| O Contraditório | fato negativo + resultado positivo inesperado | Perdi 5 clientes no mês passado. / Mas nunca faturei tão alto. |
| A Transformação | antes + agora, em linhas paralelas | Antes: Eu corria atrás de clientes. / Agora: Eles é que me procuram. |
| O Contraste | conquista + "Sem [atalho comum]" | Cheguei a R$ 1 milhão em vendas. / Sem um escritório ou equipe. |
| O Específico | resultado com número e prazo + promessa de mostrar | Reduzi reuniões em 40% em um mês. / Meu playbook: |
| A Citação | "frase que o público diz" + reação | "Meu nicho já está saturado". / Vou te provar o contrário. |
| A Maturação | tempo de experiência + aprendizado | Por 4 anos eu ignorei networking. / Hoje entendo que foi um erro. |
| A Referência | pessoa conhecida disse: + citação cortada | Simon Sinek disse uma vez: / "As pessoas não compram o que…" |
| O Direto | opinião firme + justificativa ou prova | Trabalhar duro não é o suficiente. / E eu posso provar. |
| A Lista | N itens para X: + qualificador | 7 erros comuns no LinkedIn: / (Eu cometi todos.) |
| O Utilitário | Todo [público] faz isto: + raridade | Todo líder inteligente faz isto: / Mas quase ninguém percebe. |
| A Isca | afirmação provocativa + confirmação seca | Ninguém liga para o que você fala. / E isso é bom. |

Regras: nunca invente o número ou a história do hook; a linha 2 não pode montar "não é X, é Y"; o corpo do post precisa entregar o que o hook promete.

**Lacunas:** se faltar algo essencial para o formato escolhido (um Estudo de Caso sem números, uma História Vulnerável sem a história), pergunte ao usuário antes de seguir. Se não faltar nada, siga direto para a escrita.

## PASSO 6: PASSAR PARA A ESCRITA

Sem lacunas, ative a skill `linkedin-copy` e escreva o post a partir do briefing na mesma resposta. O usuário pode ajustar o briefing depois, se quiser.

---

## ORDEM DE USO NO FLUXO

1. (opcional) `niche-research`: temas e histórias da semana
2. (opcional) `viral-hook-creator`: gerar e escolher o hook
3. ✅ **linkedin-post-structure**: briefing (ângulo, formato, framework, esqueleto)
4. `linkedin-copy`: escrita na voz do projeto, já formatada para mobile
5. `linkedin-anti-ai`: revisão final de humanização (última etapa que mexe em palavras)
6. (opcional) `linkedin-post-design`: visual do post
