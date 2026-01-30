# LockFy MTA:SA Snippets

A extensão mais completa de snippets Lua para desenvolvimento MTA:SA no VS Code.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![MTA:SA](https://img.shields.io/badge/MTA--SA-2026-green.svg)
![Lua](https://img.shields.io/badge/Lua-5.1-purple.svg)

---

## O que é isso?

Cansado de ficar abrindo wiki toda hora pra lembrar os parâmetros de uma função? Essa extensão resolve isso. São mais de 1400 snippets das natives do MTA:SA, tudo sincronizado direto com a documentação oficial da wiki.

Funciona pra **server-side**, **client-side** e funções **compartilhadas**.

---

## Instalação

### Pelo VS Code
1. Abre o VS Code
2. Ctrl+Shift+X (Extensões)
3. Procura "LockFy MTA:SA"
4. Clica em Install

### Manual
1. Baixa o arquivo `.vsix` da aba Releases
2. VS Code → Extensões → "..." → "Install from VSIX"
3. Seleciona o arquivo

---

## Como usar

Digita o nome da função e aperta Tab. Simples assim.

```lua
-- Exemplo: digita "createPed" e da Tab
createPed( 520, 0, 0, 0 )

-- Exemplo: "addEventHandler"
addEventHandler( "onPlayerJoin", root, function()
    -- teu código aqui
end)
```

### Navegando pelos parâmetros
Depois que o snippet expande, aperta Tab pra ir pulando entre os campos. Muito mais rápido que ficar digitando tudo na mão.

---

## O que tem aqui?

- **1404 funções MTA:SA** - Todas as natives organizadas por categoria
- **9 snippets Lua base** - For, ipairs, pairs, function, local, etc.
- **Snippets XML** - Pra meta.xml (info, script, file, export...)
- **Identificação de lado** - Cada snippet mostra se é Server, Client ou Shared

### Categorias cobertas

Todas as categorias da wiki: ACL, Account, Admin, Audio, Blip, Browser, Camera, Colshape, Cursor, Database, Discord, Drawing, Effects, Element, Engine, Event, Explosion, File, Fire, GUI, HTTP, Input, Light, Map, Marker, Module, Object, Output, Path, Ped, Pickup, Player, Projectile, Radar_area, Resource, SVG, Searchlight, Server, Settings_registry, Team, Text, UTF8, Utility, Vehicle, Water, Weapon, Weapon_creation, World, XML.

---

## Exemplo de estrutura de resource

```
minha_resource/
├── meta.xml
├── server.lua
└── client.lua
```

**meta.xml:**
```xml
<meta>
    <info author="Zeus" version="1.0.0" name="MinhaResource" description="Descrição aqui" type="script"/>
    
    <script src="server.lua" type="server"/>
    <script src="client.lua" type="client"/>
</meta>
```

---

## Sincronização automática

Tem um script Python na pasta `tools/` que sincroniza todos os snippets direto com a wiki oficial. Se quiser atualizar tudo manualmente:

```bash
python tools/sync_natives.py
```

Isso baixa os YAMLs mais recentes da wiki e regenera o arquivo de snippets.

---

## Requisitos

- VS Code 1.90 ou superior
- Extensão Lua (recomendado pra syntax highlighting)

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
