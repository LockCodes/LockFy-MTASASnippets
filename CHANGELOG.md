# Changelog

## [1.0.0] - 2026-01-30

Lançamento inicial da extensão LockFy MTA:SA Snippets.

### Novidades

- **1404 snippets** das funções MTA:SA, sincronizadas direto da wiki oficial
- **9 snippets Lua essenciais** (for, ipairs, pairs, function, local, etc.)
- **Snippets XML** pra meta.xml completo
- Cobertura de todas as 52 categorias de funções
- Script de sincronização automática (`tools/sync_natives.py`)
- Suporte a VS Code 1.90+

### Detalhes técnicos

- Todas as funções identificadas como Server-side, Client-side ou Shared
- Placeholders inteligentes pra navegação com Tab
- Snippets gerados automaticamente a partir dos arquivos YAML oficiais
- Fallback via download de ZIP quando API do GitHub está com rate limit

---

## Notas

Essa extensão é uma reescrita completa e atualização de projetos antigos de snippets MTA:SA. O foco foi trazer uma base de dados completa e atualizada, com ferramentas pra manter tudo sincronizado facilmente.
