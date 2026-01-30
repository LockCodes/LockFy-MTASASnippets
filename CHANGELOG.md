# Changelog

## [1.0.0] - 2026-01-30

Lançamento inicial da extensão LockFy MTA:SA Snippets.

### Novidades

- **1404 snippets** das funções MTA:SA, sincronizadas direto da wiki oficial
- **9 snippets Lua essenciais** (for, ipairs, pairs, function, local, etc.)
- **Snippets XML** pra meta.xml completo
- **Type Definitions (LuaCATS)** - Arquivo `mta-sa.lua` com annotations completas
  - Tipos de todos os parâmetros
  - Descrições das funções
  - Retornos tipados
  - Classes de elementos (player, vehicle, ped, etc.)
- Cobertura de todas as 52 categorias de funções
- Scripts de sincronização automática (`tools/sync_natives.py`)
- Script de geração de definições (`tools/generate_definitions.py`)
- Suporte a VS Code 1.90+

### Funcionalidades

- **Snippets**: Expande funções com Tab
- **Hover**: Descrição ao passar o mouse (requer Lua Language Server)
- **Type Checking**: Validação de tipos em tempo real (requer Lua Language Server)
- **Autocompletar**: Sugestões inteligentes com tipos (requer Lua Language Server)
- **Identificação de lado**: Server/Client/Shared para cada função

---

## Notas

Essa extensão é uma reescrita completa e atualização de projetos antigos de snippets MTA:SA. O foco foi trazer uma base de dados completa e atualizada, com ferramentas pra manter tudo sincronizado facilmente.

Para experiência completa com IntelliSense, instale a extensão **Lua Language Server** (Sumneko) e configure o `mta-sa.lua` na biblioteca do workspace.
