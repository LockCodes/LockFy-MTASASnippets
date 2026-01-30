# LockFy MTA:SA Snippets

A extensão mais completa de snippets Lua para desenvolvimento MTA:SA no VS Code, agora com **Type Definitions** para IntelliSense completo.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![MTA:SA](https://img.shields.io/badge/MTA--SA-2026-green.svg)
![Lua](https://img.shields.io/badge/Lua-5.1-purple.svg)

---

## O que é isso?

Cansado de ficar abrindo wiki toda hora pra lembrar os parâmetros de uma função? Essa extensão resolve isso. São mais de 1400 snippets das natives do MTA:SA, tudo sincronizado direto com a documentação oficial da wiki.

**NOVO**: Agora com Type Definitions completas! Isso significa:
- ✅ **Hover** - Passe o mouse em cima da função e veja a descrição
- ✅ **Autocompletar inteligente** - Veja os tipos de cada parâmetro
- ✅ **Linting** - Detecta erros de tipos automaticamente
- ✅ **Navegação** - Ctrl+Click nas funções para ver definição

Funciona pra **server-side**, **client-side** e funções **compartilhadas**.

---

## Instalação

### 1. Instale o LockFy MTA:SA Snippets

#### Via VS Code Marketplace (quando publicar)
1. Abre o VS Code
2. Ctrl+Shift+X (Extensões)
3. Procura "LockFy MTA:SA"
4. Clica em Install

#### Manual
1. Baixa o arquivo `.vsix` da aba Releases
2. VS Code → Extensões → "..." → "Install from VSIX"
3. Seleciona o arquivo

### 2. Instale o Lua Language Server (RECOMENDADO)

Para ter **hover**, **linting** e **type checking**:

1. Ctrl+Shift+X (Extensões)
2. Procura **"Lua"** do **Sumneko** (ou **Lua Language Server**)
3. Instala

### 3. Configure as Type Definitions

Para o Lua Language Server reconhecer as funções MTA:SA:

#### Opção A: Configuração no Workspace (Recomendado)

Crie ou edite o arquivo `.vscode/settings.json` na pasta do seu projeto:

```json
{
    "Lua.workspace.library": [
        "${workspaceFolder}/definitions/mta-sa.lua"
    ],
    "Lua.workspace.checkThirdParty": false
}
```

Baixe o arquivo `mta-sa.lua` da última release e coloque na pasta `definitions/` do seu projeto.

#### Opção B: Configuração Global

1. Abra as configurações do VS Code (`Ctrl+,`)
2. Procure por "Lua.workspace.library"
3. Adicione o caminho para o arquivo `mta-sa.lua`:
   - Windows: `C:\Users\SeuNome\.vscode\extensions\...\definitions\mta-sa.lua`

---

## Como usar

### Snippets (Autocompletar)

Digita o nome da função e aperta Tab. Simples assim.

```lua
-- Exemplo: digita "createPed" e da Tab
createPed( 520, 0, 0, 0 )

-- Exemplo: "addEventHandler"
addEventHandler( "onPlayerJoin", root, function()
    -- teu código aqui
end)
```

### IntelliSense (Hover e Type Checking)

Depois de configurar o Lua Language Server:

1. **Hover** - Passe o mouse sobre `createPed` e veja:
   ```
   function createPed(model: integer, x: number, y: number, z: number): ped | false
   This function creates a Ped (NPC) at the specified location.
   ```

2. **Autocompletar de parâmetros** - Comece a digitar e veja os tipos:
   ```lua
   createPed(
       model: integer,  -- <- Mostra o tipo
       x: number,       -- <- Mostra o tipo
       ...
   )
   ```

3. **Detecção de erros** - Erros de tipo são destacados:
   ```lua
   createPed("invalid", 0, 0, 0)  -- <- Erro: esperava integer, recebeu string
   ```

---

## O que tem aqui?

- **1404 funções MTA:SA** - Todas as natives organizadas por categoria
- **9 snippets Lua base** - For, ipairs, pairs, function, local, etc.
- **Snippets XML** - Pra meta.xml (info, script, file, export...)
- **Type Definitions completas** - Todas as funções com tipos e descrições
- **Identificação de lado** - Cada snippet mostra se é Server, Client ou Shared

### Categorias cobertas

Todas as 52 categorias da wiki: ACL, Account, Admin, Audio, Blip, Browser, Camera, Colshape, Cursor, Database, Discord, Drawing, Effects, Element, Engine, Event, Explosion, File, Fire, GUI, HTTP, Input, Light, Map, Marker, Module, Object, Output, Path, Ped, Pickup, Player, Projectile, Radar_area, Resource, SVG, Searchlight, Server, Settings_registry, Team, Text, UTF8, Utility, Vehicle, Water, Weapon, Weapon_creation, World, XML.

---

## Exemplo de estrutura de resource

```
minha_resource/
├── .vscode/
│   └── settings.json      <- Configuração do Lua Language Server
├── definitions/
│   └── mta-sa.lua         <- Type definitions (baixar da release)
├── meta.xml
├── server.lua
└── client.lua
```

**meta.xml:**
```xml
<meta>
    <info author="Zeus" version="1.0.0" name="MinhaResource" 
          description="Descrição aqui" type="script"/>
    
    <script src="server.lua" type="server"/>
    <script src="client.lua" type="client"/>
</meta>
```

**server.lua:**
```lua
-- Com IntelliSense ativo, você verá:
-- - Descrição ao passar o mouse
-- - Tipos dos parâmetros
-- - Autocompletar inteligente

local player = getPlayerFromName("Zeus")
if player then
    setElementPosition(player, 0, 0, 5)  -- Hover mostra: (theElement: element, x: number, y: number, z: number)
end
```

---

## Sincronização automática

Tem scripts Python na pasta `tools/`:

```bash
# Sincroniza snippets com a wiki
python tools/sync_natives.py

# Gera type definitions
python tools/generate_definitions.py
```

Isso baixa os YAMLs mais recentes da wiki e regenera os arquivos.

---

## Requisitos

- VS Code 1.90 ou superior
- **Lua Language Server** (Sumneko) - Para IntelliSense completo (hover, linting, types)

---

## Autor

Feito por **Zeus** - [GitHub](https://github.com/LockCodes)

---

## Licença

MIT License - veja o arquivo [LICENSE](LICENSE) pra mais detalhes.

---

<div align="center">

[🔝 Voltar ao topo](#lockfy-mtasa-snippets)

</div>
