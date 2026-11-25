---
name: "viral-hook-creator"
description: "Cria hooks de LinkedIn (as primeiras linhas antes do \"ver mais\": hook + re-hook) usando 12 padrões testados, com exemplos reais de cada um: O Educativo, O Contraditório, A Transformação, O Contraste, O Específico, A Citação, A Maturação, A Referência, O Direto, A Lista, O Utilitário e A Isca. Lê a voz do projeto automaticamente e escolhe os padrões que o material sustenta. Ative quando o usuário mencionar: \"gancho\", \"hook\", \"abertura\", \"hooks para o post\", \"não sei como começar\", \"frase de impacto\", \"gera hooks\", \"melhora esse hook\", ou quando um post está pronto mas o início é fraco. Use antes da linkedin-post-structure.\n"
---

# Viral Hook Creator (v2): 12 Padrões de Hook

## INÍCIO AUTOMÁTICO

Quando esta skill for ativada, vá direto ao Passo 1. Não explique o que é um bom hook, não descreva o processo.

## O QUE É O HOOK AQUI

No LinkedIn, o leitor vê umas 3 linhas antes do "ver mais". O hook ocupa esse espaço em duas linhas separadas por uma linha em branco:

```
[Linha 1: o hook]

[Linha 2: o re-hook]
```

- **Linha 1 (hook):** para o scroll. Afirma algo específico, inesperado ou reconhecível.
- **Linha 2 (re-hook):** dá o motivo para clicar. Abre um loop, promete o conteúdo, vira a expectativa ou qualifica a linha 1.
- Cada linha com até uns 40 caracteres. A linha 2 nunca repete a linha 1 com outras palavras.

---

## PASSO 1: VOZ E MATERIAL (automático)

- Procure `about-me.md` e `voice.md` nos arquivos do projeto atual e leia os dois. Não peça confirmação, não pergunte para quem é o post, não comente que leu.
- Se a mensagem trouxer tema, rascunho, post pronto, briefing da `linkedin-post-structure` ou material bruto, use isso.
- Se não trouxer nada, pergunte apenas: "Sobre o que é o post? Uma frase basta." e espere.

### Matéria-prima
Antes de escrever, separe do material e do `about-me.md`:
- **Números reais:** resultados, prazos, quantidades, valores
- **Antes e depois:** como era, como ficou
- **Erros e fracassos** com consequência concreta
- **Frases que o público diz ou pensa** sobre o tema
- **Crenças comuns** do público que a pessoa discorda
- **Tempo de experiência** no assunto

Hooks bons saem desse material. Nunca invente número, resultado, tempo de experiência ou história. Se um padrão precisa de um dado que não existe, escolha outro padrão ou marque o ponto como `[confirmar: ...]`.

---

## PASSO 2: ESCOLHER OS PADRÕES

Escolha 6 padrões diferentes entre os 12, os que o material sustenta melhor. Não use uma ordem fixa. Use a tabela abaixo para decidir.

| O material tem... | Padrões que combinam |
|-------------------|----------------------|
| Um método, passo a passo ou guia | O Educativo, A Lista, O Específico |
| Resultado com número e prazo | O Específico, O Contraste, A Transformação |
| Um resultado ruim que virou bom | O Contraditório, A Transformação |
| Uma conquista sem o atalho que todos usam | O Contraste |
| Uma frase que o público repete | A Citação |
| Anos de experiência ou um aprendizado lento | A Maturação |
| Uma opinião firme | O Direto, A Isca |
| Um padrão que os melhores seguem | O Utilitário |
| Uma ideia ancorada em alguém conhecido | A Referência |

Combinação com os formatos da `linkedin-post-structure`, quando houver briefing:

| Formato do post | Padrões preferidos |
|-----------------|--------------------|
| Perspectiva Contrária | O Direto, A Isca, O Contraste, A Citação |
| Baseado em Dados | O Específico, O Utilitário, A Lista |
| Filosofia Operacional | O Direto, A Maturação, A Referência |
| Estudo de Caso | O Específico, A Transformação, O Contraste |
| Guia Como Fazer | O Educativo, O Específico, A Lista |
| Produto Soft | A Transformação, A Citação, O Contraste |
| História Vulnerável | O Contraditório, A Maturação, A Transformação |
| Bastidores | O Utilitário, O Específico, A Maturação |
| Humor Relacionável | A Citação, A Isca |
| Iniciador de Discussões | O Direto, A Isca, A Citação |
| Complete a Frase | A Citação |
| Teaser de Conteúdo | A Lista, O Educativo |
| Reconhecimento Colaborativo | A Maturação, A Referência |

Se o `voice.md` disser que a pessoa evita algum estilo (provocação, frases de terceiros, números de faturamento), tire os padrões correspondentes.

---

## PASSO 3: ESCREVER

Para cada padrão escolhido, escreva um hook seguindo a estrutura e o tom dos exemplos da biblioteca abaixo. Adapte o vocabulário e o ritmo à voz do projeto. Use os exemplos como modelo de estrutura, nunca copie a frase de um exemplo.

## PASSO 4: FILTRO DE QUALIDADE

Passe cada hook por estas perguntas. Se falhar em alguma, reescreva ou troque o padrão:

1. **É específico?** Tem número, prazo, nome, situação ou frase reconhecível? "Cresci muito no LinkedIn" falha. "Cheguei a 50 mil seguidores" passa.
2. **O post consegue pagar?** O corpo do post entrega exatamente o que o hook promete? Se o hook promete "5 passos", o material tem 5 passos?
3. **A linha 2 acrescenta?** Ela abre um loop, promete algo ou vira a expectativa? Se só repete a linha 1, falha.
4. **Soa como a pessoa?** Ela falaria isso numa conversa? Se soa como anúncio, falha.
5. **É crível?** Um leitor do público acreditaria? Promessa grande sem prova falha.
6. **Passa nas proibições?**
   - Nenhum travessão (— ou –)
   - Nenhum "Não é X, é Y", nem uma linha 2 que monte esse contraste ("Sabe do que você precisa? Não é Y.")
   - Nenhum par espelhado de frase de efeito ("Pare de X. Comece a Y." com X e Y genéricos)
   - Nenhuma palavra da lista negra da `linkedin-anti-ai`
   - Nenhum emoji, salvo se o `voice.md` usar

---

## PASSO 5: ENTREGA

Entregue os 6 hooks em um code block, numerados, com o nome do padrão:

```
1. O Específico
Faturei R$ 30 mil só em julho.

Vou te mostrar o processo:

2. O Contraditório
...
```

Depois do code block, uma linha por hook dizendo o que o corpo do post precisa entregar para cumprir a promessa. Marque um deles como recomendado, com o motivo em uma frase.

Termine com:

> Qual número? Também posso gerar mais variações de um padrão específico.

### Depois da escolha
- Se o usuário escolher um número, ative a `linkedin-post-structure` com o hook escolhido e o nome do padrão. Ela monta o briefing mantendo esse hook, e a `linkedin-copy` escreve o post.
- Se pedir variações de um padrão, entregue 5 versões novas daquele padrão, todas diferentes entre si.

## MODO REESCRITA

Se o usuário colar um hook fraco ou um post com abertura fraca:
1. Diga em uma linha por que o hook atual não prende (vago, sem tensão, promessa genérica, linha 2 repete a 1, etc.).
2. Entregue 4 reescritas em 4 padrões diferentes, no mesmo formato da entrega.

---

## BIBLIOTECA: OS 12 PADRÕES

### 1. O Educativo
**Estrutura:** "Como [resultado que o leitor quer]." + re-hook com o formato do conteúdo ou a condição que remove o medo.
**Re-hooks típicos:** "Este é o guia completo:", "(Em 6 passos simples):", "(Sem [dor comum]).", "É assim que eu faço:"
**Quando usar:** o post ensina um método.
**Exemplos:**
- Como crescer no LinkedIn. / Este é o guia completo:
- Como estruturar sua marca pessoal. / (Em 6 passos simples):
- Como postar todos os dias. / (Sem ser genérico).
- Como monetizar sua perspectiva única. / É assim que eu faço:
- Como escrever textos que conquistam: / Para se destacar na multidão de IA.
- Como sistematizar sua presença online. / Em 6 engrenagens conectadas:
- Como gerar leads sem forçar a barra. / A física da confiança:
- Como criar posts que geram negócios. / (Sem tentar viralizar o tempo todo.)
- Como escolher um nicho sem travar. / Use esta matriz simples.
- Como validar uma oferta em minutos. / Sem gastar um centavo.

### 2. O Contraditório
**Estrutura:** um fato negativo, de preferência com número + um resultado positivo que parece não combinar com ele.
**Re-hooks típicos:** "Mas foi o meu melhor mês.", "Mas nunca faturei tão alto.", "Hoje [resultado]."
**Quando usar:** uma perda ou fracasso levou a um resultado melhor. O corpo explica a relação entre as duas coisas.
**Exemplos:**
- Meu alcance caiu 30% em agosto. / Mas foi o meu melhor mês.
- Perdi 5 clientes no mês passado. / Mas nunca faturei tão alto.
- Perdi 1.000 seguidores. / Ganhei 10 compradores.
- Fracassei em 5 negócios. / Hoje vivo do que amo.
- R$ 10 mil em anúncios = Fracasso. / Um post orgânico = Sucesso.
- Meu produto foi um fracasso total. / Essa foi a minha melhor experiência.
- Perdi o emprego dos sonhos. / Mas ganhei a chance de construir outro.
- Nem a minha mãe acreditou em mim. / Hoje minha marca está pelo mundo.
- Fui recusado em 4 vagas de emprego. / A 5ª me aceitou sem fazer entrevista.
- Nunca viralizei no LinkedIn. / Ainda assim, minha agenda lotou.

### 3. A Transformação
**Estrutura:** o estado de antes (com ano ou marco de tempo) + o estado de agora, em linhas paralelas.
**Marcadores típicos:** "2024: / 2025:", "Antes: / Agora:", "Ano passado: / Hoje:"
**Quando usar:** há uma mudança real e mensurável. O corpo conta o que aconteceu no meio.
**Exemplos:**
- 2024: Quase desistindo de empreender. / 2025: Faturando 6 dígitos por mês.
- No ano passado, mal sabia para onde ir. / Hoje, tenho certeza em cada passo.
- 2015: Trabalhando num cubículo. / 2025: Trabalhando de qualquer lugar.
- 2021: Vivendo de bicos e freelas. / 2024: Com uma empresa que só cresce.
- Ano passado: totalmente perdido. / Agora: palestrando pelo mundo.
- Ano passado eu estava desempregado. / Hoje eu tenho meu próprio negócio.
- Parei de consumir tantos cursos. / Hoje, estou lançando o meu.
- Antes: Fazendo conteúdo aleatório. / Agora: Tenho uma audiência engajada.
- Antes: Eu corria atrás de clientes. / Agora: Eles é que me procuram.
- 2020: Duvidando de mim mesmo. / 2025: Mentorando outras pessoas.

### 4. O Contraste
**Estrutura:** uma conquista + "Sem [o atalho, recurso ou sacrifício que todo mundo acha obrigatório]."
**Quando usar:** a pessoa chegou a um resultado por um caminho diferente do comum. O corpo mostra o caminho.
**Exemplos:**
- Cheguei aos 50 mil seguidores. / Sem seguir os passos dos gurus.
- Alcancei 100 mil inscritos no YouTube. / Sem gastar nada com divulgação.
- Cheguei a R$ 1 milhão em vendas. / Sem um escritório ou equipe.
- Tenho 3 negócios lucrativos. / Sem trabalhar 12 horas por dia.
- Construí minha marca pessoal. / Sem seguir nenhuma fórmula mágica.
- Me tornei gerente aos 25 anos. / Sem puxar saco de ninguém.
- Não espere a oportunidade perfeita. / Comece com o que você tem agora.

**Cuidado:** a variação "Pare de [X]. / Comece a [Y]." vira facilmente frase de efeito espelhada. Use só quando X e Y forem específicos do tema (ex.: "Pare de postar 3 vezes por dia. / Poste 1 vez com dados próprios."), nunca genéricos como "Pare de pensar. / Comece a agir."

### 5. O Específico
**Estrutura:** resultado com número e prazo exatos + promessa de mostrar como.
**Re-hooks típicos:** "Vou te mostrar o processo:", "Meu playbook:", "Foram 5 passos simples.", "Esta foi a minha técnica:"
**Quando usar:** há um resultado mensurável e um processo replicável por trás.
**Exemplos:**
- Faturei R$ 30 mil só em julho. / Vou te mostrar o processo:
- Cheguei a 100k seguidores em 2 anos. / Vou te contar o "segredo" para isso:
- Faturei R$ 50 mil em 7 dias. / Vou te mostrar como consegui:
- Dobrei meu salário em 6 meses. / Foram 5 passos simples.
- Li 50 livros em 1 ano. / Esta foi a minha técnica:
- Morei em 4 países em 4 anos. / Estas são as melhores memórias:
- Conquistei 100 clientes em 100 dias. / Vou mostrar como foi possível:
- 1 milhão de views em 4 posts. / (E ainda gerei negócios):
- Reduzi reuniões em 40% em um mês. / Meu playbook:
- Eu fiz 10 entrevistas em 10 dias. / Estas foram as minhas estratégias:

### 6. A Citação
**Estrutura:** entre aspas, uma frase que o público diz ou pensa + uma reação a ela (identificação, provocação ou promessa).
**Re-hooks típicos:** "Aposto que você já disse isso.", "Vou te provar o contrário.", "Spoiler: o problema não são eles.", "Vou te ajudar com isso em 4 passos:"
**Quando usar:** existe uma objeção ou crença limitante clara no público. Funciona muito bem com PAS e APP.
**Exemplos:**
- "Eu não sei sobre o que postar" / Talvez você pense isso hoje.
- "Eu não consigo vender no LinkedIn" / Essa frase é cada vez mais comum.
- "Não tenho tempo para criar posts". / Aposto que você já disse isso.
- "Meu nicho já está saturado". / Vou te provar o contrário.
- "Tenho medo de me expor online". / É isso que você pensa?
- "Minha audiência não compra nada". / Spoiler: o problema não são eles.
- "Falhar não é uma opção". / Essa é a frase que te bloqueia.
- "Eu preciso postar todos os dias". / Não, você não precisa.
- "Eu não consigo cobrar mais caro." / Não até explicar valor do jeito certo.
- "Eu não sei me posicionar." / Vou te ajudar com isso em 4 passos:

### 7. A Maturação
**Estrutura:** tempo ou experiência acumulada + o aprendizado (ou a promessa de ensinar rápido o que levou tempo).
**Re-hooks típicos:** "Aprendi [X]:", "E vou te ensinar em 5 minutos:", "Hoje entendo que foi um erro."
**Quando usar:** a autoridade vem do tempo de estrada. Combina com História Vulnerável e Filosofia Operacional.
**Exemplos:**
- Depois de 12 anos em gestão. / Aprendi como um líder deve ser:
- Foram 10 anos empreendendo. / Assim aprendi o segredo da recorrência.
- Depois de 5 anos, aprendi a negociar. / E vou te ensinar em 5 minutos:
- Demorei 2 anos para entender isto. / E se você empreende, vai querer saber:
- Foram 6 meses estudando funis. / Vou te ensinar em 6 minutos:
- Por 4 anos eu ignorei networking. / Hoje entendo que foi um erro.
- Levei 3 anos para aprender o simples: / Dizer não.
- Precisei de um burnout. / Foi assim que aprendi a delegar.
- Depois de 100 reuniões, eu aprendi: / Umas 99 poderiam ser e-mails.

**Cuidado:** a linha 2 não pode virar moral genérica ("Consistência vence talento."). Ela precisa apontar para algo concreto que o post vai mostrar.

### 8. A Referência
**Estrutura:** "[Pessoa conhecida] disse:" + o começo da frase, cortado com reticências para forçar o clique.
**Quando usar:** a frase é a porta de entrada para uma opinião ou experiência da própria pessoa. O post precisa ir além da citação.
**Exemplos:**
- Simon Sinek disse uma vez: / "As pessoas não compram o que…"
- Steve Jobs falou isto uma vez: / "A única maneira de fazer algo…"
- Naval disse o que mudou minha vida: / "Aprenda a vender. Aprenda a…"
- David Ogilvy disse: / "Se não vende, não é criativo."

**Cuidado:** muita frase famosa circula com autor errado. A da insanidade não tem registro de Einstein, a dos "cavalos mais rápidos" não tem registro de Henry Ford, e a dos "vinte anos" não é de Mark Twain. Só use citação com autoria confirmada em pesquisa. Na dúvida, troque de padrão.

### 9. O Direto
**Estrutura:** uma opinião firme em uma frase curta + a justificativa ou a promessa de provar.
**Re-hooks típicos:** "Vou te dizer o porquê.", "E eu posso provar.", "Entender isso salvou meu negócio."
**Quando usar:** a pessoa tem uma posição clara e defensável. Combina com Iniciador de Discussões e Perspectiva Contrária.
**Exemplos:**
- Eu não quero viralizar. / E penso que esse é o caminho.
- LinkedIn não é para emprego. / Vou te dizer o porquê.
- Eu não acredito em receita milagrosa. / Resultados vêm do básico bem feito.
- Trabalhar duro não é o suficiente. / E eu posso provar.
- Currículos estão ultrapassados. / Vou te dizer algo melhor.
- LinkedIn não vende sozinho. / Estratégia importa, e muito.
- Nem todo cliente tem sempre razão. / Entender isso salvou meu negócio.
- Seu diploma não define seu valor. / Resultados falam mais alto.
- Eu não romantizo madrugadas. / Prefiro energia estável todo dia.

**Cuidado:** evite a forma "Eu não faço X. / Faço Y." com X e Y em espelho, porque monta o "não é X, é Y" proibido.

### 10. A Lista
**Estrutura:** "[Número] [itens] para [público ou objetivo]:" + um qualificador que aumenta a credibilidade ou a curiosidade.
**Re-hooks típicos:** "(Testadas por mim).", "(Eu cometi todos.)", "O terceiro abriu meus olhos.", "(Salve para ver depois).", "Mesmo que não pareça."
**Quando usar:** o post é uma lista de ferramentas, erros, passos, sinais ou hábitos.
**Exemplos:**
- 12 ferramentas para designers: / (Testadas por mim).
- 11 habilidades úteis para sua carreira: / Não importa a sua área.
- 5 livros obrigatórios para creators: / O terceiro abriu meus olhos.
- 7 erros comuns no LinkedIn: / (Eu cometi todos.)
- 9 sites para agilizar seu trabalho: / (Salve para ver depois).
- 8 passos para lançar seu produto: / Sem se perder no processo.
- 7 sinais de que você está crescendo: / Mesmo que não pareça.
- 10 hábitos dos líderes humanos: / (Eles estão construindo o futuro).
- 12 métricas que importam de verdade: / (E como você pode analisá-las).
- 9 prompts de IA que aceleram seu dia. / (Sem ser aqueles básicos de uma linha).

**Cuidado:** o número do hook tem que bater com o número de itens do post.

### 11. O Utilitário
**Estrutura:** "Todo [público] [faz / precisa / já passou por] isto:" + um re-hook de raridade ou mistério.
**Re-hooks típicos:** "(E poucos falam sobre).", "Mas quase ninguém percebe.", "E quem não passou, vai passar.", "É um tipo de diferencial oculto."
**Quando usar:** existe um padrão de comportamento que o público reconhece ou deveria copiar.
**Exemplos:**
- Todo marketeiro precisa saber disto: / (E poucos falam sobre).
- Todo revolucionário tem este hábito: / É um padrão:
- Todo líder inteligente faz isto: / Mas quase ninguém percebe.
- Todo freelancer já passou por isso: / E quem não passou, vai passar.
- Todo criador de conteúdo faz isto: / (E ninguém entende o motivo).
- Os melhores vendedores fazem isto: / É um tipo de diferencial oculto.
- Todo criativo precisa de descanso. / Sem isso, trava.
- É assim que você melhora as vendas: / Primeiro: grave 10 calls.

**Cuidado:** não use a variação "Sabe do que todo [público] precisa? / Não é [X]." porque ela prepara o "não é X, é Y" no corpo.

### 12. A Isca
**Estrutura:** uma afirmação provocativa, quase absurda + uma confirmação seca. O corpo do post reenquadra a afirmação e mostra o sentido real.
**Re-hooks típicos:** "É isso mesmo.", "E isso é bom.", "Aceite isso.", "Vai por mim.", "Direto ao ponto."
**Quando usar:** a pessoa tem uma opinião forte e o post tem uma virada clara. Funciona em Iniciador de Discussões e Humor.
**Exemplos:**
- É impossível vender no LinkedIn. / É isso mesmo.
- Ninguém liga para o que você fala. / E isso é bom.
- Você não vai ficar rico rápido. / Aceite isso.
- Aprender dói. / E é por isso que a maioria desiste.
- Sucesso é chato. / Direto ao ponto.
- Seu primeiro produto será horrível. / É natural que seja assim.

**Cuidado:** sem virada no corpo, a isca vira clickbait. Não use para defender ideias que fariam mal ao leitor (romantizar excesso de trabalho, por exemplo). Para clientes de perfil mais conservador, prefira O Direto.

---

## ORDEM DE USO NO FLUXO

1. (opcional) `niche-research`: temas e histórias da semana
2. ✅ **viral-hook-creator**: gerar e escolher o hook
3. `linkedin-post-structure`: briefing (ângulo, formato, framework, esqueleto)
4. `linkedin-copy`: escrita na voz do projeto
5. `linkedin-anti-ai`: revisão final
6. (opcional) `linkedin-post-design`: visual do post
