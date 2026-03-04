# AGENTS.md - Neovim Configuration

This is a personal Neovim configuration built on **AstroNvim v5+** using the
AstroNvim template. The entire config is written in **Lua** (no Vimscript).
The primary use case includes competitive programming (C++) and multi-language
development (TypeScript, Python, Go, etc.).

## Project Structure

```
init.lua              # Entry point: bootstraps lazy.nvim, loads lazy_setup + polish
lua/
  lazy_setup.lua      # lazy.nvim setup (imports AstroNvim, community, plugins)
  community.lua       # AstroCommunity language packs and extras
  polish.lua          # Post-setup hook (currently deactivated)
  plugins/            # One plugin config per file (astrocore, astrolsp, astroui,
                      #   blink, clangd, code-runner, hover, luasnip, mappings,
                      #   mason, treesitter)
snippets/             # Custom VSCode-format C++ competitive programming snippets
```

## Package Manager

**lazy.nvim** is the plugin manager. Bootstrapped in `init.lua`, configured in
`lua/lazy_setup.lua`. Lockfile: `lazy-lock.json`.

**Mason** (`mason-tool-installer.nvim`) manages LSP servers, formatters, and
debuggers. Ensured tools: `lua-language-server`, `stylua`, `debugpy`,
`tree-sitter-cli`.

## Build / Lint / Test Commands

### Linting

```bash
selene lua/                           # Lint all Lua files
selene lua/plugins/astrocore.lua      # Lint a single file
```

Selene config: `selene.toml` (std = "neovim", several rules set to "allow").
Custom globals defined in `neovim.yml` (lua51 base + `vim` global).

### Formatting

```bash
stylua lua/ init.lua                  # Format all Lua files
stylua lua/plugins/astrocore.lua      # Format a single file
stylua --check lua/ init.lua          # Check formatting without writing
```

### Validation

```bash
nvim --headless "+qall"                      # Verify config loads without errors
nvim --headless "+checkhealth lazy" "+qall"  # Check lazy.nvim plugin health
```

No test framework is configured. There are no test files.

## Code Style Guidelines

### Formatting (StyLua - `.stylua.toml`)

- **Column width:** 120
- **Indentation:** 4 spaces (no tabs)
- **Line endings:** Unix (LF)
- **Quotes:** Double quotes preferred (`AutoPreferDouble`)
- **Call parentheses:** Omit when possible (`call_parentheses = "None"`)
  - Write `require "module"` not `require("module")` for single-string-arg calls
  - Exception: multi-argument calls and expressions always use parentheses
- **Simple statements:** Collapse to single line (`collapse_simple_statement = "Always"`)

### File Organization

- One plugin spec per file in `lua/plugins/`
- Each plugin file returns a LazySpec table (or a list of specs)
- Community imports go in `lua/community.lua`, loaded before `plugins/`
- Use `lazy_setup.lua` only for lazy.nvim bootstrapping configuration

### Type Annotations

- Use LuaLS `---@type` annotations on return values for plugin specs:
  ```lua
  ---@type LazySpec
  return {
      "plugin/name",
      ---@type PluginOpts
      opts = { ... },
  }
  ```
- Use `---@diagnostic disable:` comments sparingly and only when necessary

### Naming Conventions

- **Files:** lowercase with hyphens for multi-word names (e.g., `code-runner.lua`)
- **Variables:** `snake_case` for locals and module-level variables
- **Plugin specs:** Use the full GitHub `owner/repo` string format

### Imports and Requires

- Use `require` without parentheses for single string arguments: `require "modulename"`
- Use lazy `require` inside functions for on-demand loading:
  ```lua
  function() require("astrocore.buffer").nav(vim.v.count1) end
  ```
- Never use `require` at the top of plugin spec files for plugin modules;
  always use deferred/lazy requires inside `config` or mapping functions

### Key Mappings

- Define mappings through `astrocore` opts (`opts.mappings`) rather than raw `vim.keymap.set`
- Modes: `n` (normal), `v` (visual), `i` (insert), `t` (terminal)
- Each mapping must include a `desc` field for which-key integration
- Use `<Leader>` prefix for custom commands (leader is Space)
- Use `<C-...>` notation for Ctrl combinations

### Plugin Configuration Patterns

- Prefer `opts` table merging over `config` functions when possible
- Use `config` functions only when custom setup logic is needed (e.g., LuaSnip)
- Use `specs` key for cross-plugin dependency configuration (e.g., hover.lua)
- Set `lazy = true` for plugins loaded on-demand
- Use `enabled = false` to disable unwanted plugins (e.g., friendly-snippets)

### Editor Settings

- Relative line numbers enabled, absolute line numbers enabled
- 4-space indentation, tabs expanded to spaces
- No word wrap, no format-on-save
- Diagnostics: underline only, no virtual text, no virtual lines
- Codelens enabled, inlay hints disabled, semantic tokens enabled

### Error Handling

- Use `pcall` for operations that may fail (see `init.lua` lazy.nvim validation)
- Display errors via `vim.api.nvim_echo` with `ErrorMsg` highlight group
- For shell command failures, check `vim.v.shell_error`

### Selene Linter Rules (`selene.toml`)

These rules are explicitly allowed (not flagged): `global_usage` (globals like
`vim` are expected), `if_same_then_else`, `incorrect_standard_library_use`
(Neovim APIs differ from stock Lua), `mixed_table` (LazySpec tables mix array
and map entries), `multiple_statements`.

### Snippets

- Custom VSCode-format snippets live in `snippets/` (manifest: `snippets/package.json`)
- friendly-snippets is disabled; only custom snippets are loaded
- LuaSnip loads snippets via `from_vscode.lazy_load` from the config path

## Important Notes

- `polish.lua` is deactivated (guarded by `if true then return end`). Remove
  the guard line before adding post-setup logic there.
- The `init.lua` bootstrap is sensitive - edit with caution.
- `lazy-lock.json` is version-controlled; run `:Lazy update` to update, then
  commit the lockfile.
- Leader key is Space (`<Space>`), local leader is comma (`,`).
