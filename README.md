# Oak · Sistema de Conteúdo

Protótipo do sistema de conteúdo com IA da Oak para LinkedIn. Arthur e Lucas usam para produzir os próprios posts e os dos founders clientes.

Versão atual: **v0.6** (protótipo).

## Como abrir

O app é um único arquivo HTML, sem build e sem dependências externas.

1. Mantenha a pasta `artie-design-system/` ao lado do `oak.html`. É dela que vêm as cores, a fonte Manrope e os componentes.
2. Sirva a pasta com qualquer servidor estático e abra `oak.html`. Por exemplo:
   - VS Code: extensão *Live Server*
   - Node: `npx serve .`
   - Python: `python -m http.server`

Abrir o arquivo direto (`file://`) pode impedir o carregamento da fonte. Nesse caso, o app mostra um aviso no topo.

Os dados ficam salvos no navegador (localStorage). Para voltar aos dados de exemplo, use **Configurações → Restaurar dados de exemplo**.

## O que tem

- **Overview**: o que pede ação no perfil ativo (posts aguardando aprovação, comentários e pedidos de ajuste do cliente agrupados por post, próximos posts no calendário).
- **Calendário**: no estilo do Notion, com visões Mês, Semana, Quadro e Lista. Dá para arrastar posts entre dias e status. Cada card tem o botão *Copiar texto*, que copia o post pronto para colar no LinkedIn.
- **Ideias**: captura rápida, ideias por pilar, referências e banco de ganchos.
- **Estúdio**: gera o rascunho na voz do perfil, escolhendo framework, modelo, skills e referência da Biblioteca. O kit do perfil aparece primeiro (★).
- **Resultados**: números por post, por pilar e por modelo.
- **Marca**: Cérebro da marca, Raio-X do perfil e Aprovação (a tela que o cliente recebe pelo link).
- **Biblioteca**: frameworks de escrita, modelos de post e skills, com o kit de cada perfil; Referências (swipe file) e Lead magnets (a Análise de Perfil está em construção).
- **Perfis e clientes** e **Configurações**.

Seletor de perfil na barra lateral (Arthur, Lucas, clientes), barra recolhível (Ctrl B), busca e comandos (Ctrl K), tema claro e escuro no topo.

## Estrutura

```
oak.html                 app completo (HTML, CSS e JS)
artie-design-system/     tokens, componentes, fontes Manrope e logos da Artië
```

## Status

Protótipo. Os dados de Arthur e Lucas são rascunhos, e a cliente Marina Duarte é fictícia. A geração com IA só funciona quando o app é publicado como artefato no Claude; fora disso, o Estúdio usa um modelo pronto.

Fora do escopo por enquanto: o agente conversacional ("CMO de IA") e a publicação automática no LinkedIn.
