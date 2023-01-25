# barebones-nvim
## Minimal setup for [Neovim](https://github.com/neovim/neovim).

This repository should allow for a quick, easy and unbloated setup for neovim. The main goal is to help beginners get quick into neovim configuration.  
The following plugins and features come preinstalled:

+ [Neotree](https://github.com/nvim-neo-tree/neo-tree.nvim) file browsing and all dependencies 
    - in addition [Devicons](https://github.com/nvim-tree/nvim-web-devicons) is installed, although this plugin will only work if you have a patched [Nerd Font](https://github.com/ryanoasis/nerd-fonts) installed and ready to go for your terminal
+ [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for highlighting
+ [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) to setup formatters, linters and spellchecker
+ LSP (Language Server Protocol)
    - [lspconfig](https://github.com/neovim/nvim-lspconfig) to enable LSP
    - [Mason](hLSPttps://github.com/williamboman/mason.nvim) plugin to install language servers via UI inside of neovim
    - [Compe](https://github.com/hrsh7th/nvim-cmp) plugin for auto completion, utilizing the installed LSP and LuaSnip
+ [LuaSnip](https://github.com/L3MON4D3/LuaSnip) snippet engine to add custom snippets and/or enable snippet collections
+ [FriendlySnippets](https://github.com/rafamadriz/friendly-snippets) snippet collection used by LuaSnip
+ [TabNine](https://www.tabnine.com/) AI assistent for additional suggestions for Compe

Plugins are being managed by [Packer](https://github.com/wbthomason/packer.nvim). On first launch of neovim
packer will install itself. Afterwards, you can use the command `PackerInstall`, to install all predefined plugins.
As an alternative, `PackerSync` is being run after each save of plugin/init.lua.

As an entrypoint for LSP and Null-ls, the [sumneko-lua-language-server](https://github.com/sumneko/vscode-lua) and 
[stylua](https://github.com/JohnnyMorganz/StyLua) are predefined. The language server will be installed after first
launch of neovim as a result of defining it inside `ensure_installed` in *after/plugin/lsp/setup.lua*. Stylua needs
to be installed manually. See the github repo for more details. Once the formatter is installed, lua files are being
installed upon saving the file.

## Plugin suggestions to install, if you are new neovim
- [WhichKey](https://github.com/folke/which-key.nvim) displays possible key bindings of the command you started typing
- A theme if you get annoyed by the barebones look. A good place to look for themes -> [Vim Color Schemes](https://vimcolorschemes.com/)

## File Tree
This setup has the following files tree:

nvim  
|----- after  
|....|------- plugin  
|...........|------- lsp  
|..................|------- setup.lua  
|  
|----- lua  
|....|------- barebones  
|....|......|------- keys.lua  
|....|......|------- options.lua  
|....|   
|....|------- lsp          
|...........|------- on_attach.lua  
|  
|----- plugin    
|....|------ init.lua  
|....|------ cmp.lua  
|....|------ luasnip.lua  
|....|------ mason.lua  
|....|------ neotree.lua  
|....|------ null.lua  
|....|------ tree-sitter.lua  
|----- undodir  
|----- init.lua  
|----- stylua.toml  


### Explanation:
+ ***after/plugin*** 
    - The after/plugin holds coniguration for installed plugins, to add on top of the plugin
+ ***after/lsp/setup.lua*** 
    - Configuratio file for language-server. Customize each installed server. 
+ ***lua/barebones/keys.lua*** 
    - Configuration file for key mappings. This file already defines some sane defaults as an example. *NOTE*: Current <Leader> key is _SPACE_.
+ ***lua/barebones/options.lua*** 
    - Basic options for the functionality of neovim
+ ***lua/barebones/lsp/on_attach.lua*** 
    - Defines the default on_attach property that every language server will have in common.
+ ***plugin/init.lua*** 
    - This file defines, which plugins to install with packer. The plugins are being installed on save.
+ ***plugin/*.lua*** 
    - All other files inside /nvim/plugin are configuration files for some of the installed plugins. Visit the plugin repositories for more information on configuring the plugins
+ ***undodir/* *** 
    - The undodir holds all history files for undo actions
+ ***init.lua*** 
    - The entrypoint for neovim. This files requires all modules, that the setup consists of.
+ ***stylua.toml*** 
    - Configuration file for the Lua formatter *stylua*

If more information is needed or something is not working correctly, please file an issue. PROST!
