<h1 align="center"> barebones-nvim 🦴 </h1>

<p align="center">A minimal setup for <a href="https://github.com/neovim/neovim">Neovim</a> - your personal development environment!</p>

---

<br/>

# Introduction

This repository should allow for a quick, easy and unbloated setup for neovim with sane presets. The main goal is to help beginners get quickly 
into neovim configuration.

The following plugins and features come preinstalled:

<br/>

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

<br/>

Plugins are managed by [Packer](https://github.com/wbthomason/packer.nvim). On first launch of neovim,
packer will install itself. Afterwards, you can use the command `PackerInstall`, to install all predefined plugins.
As an alternative, `PackerSync` runs after each save of */plugin/init.lua*.

<br/>

As an entrypoint for LSP and Null-ls, the [sumneko-lua-language-server](https://github.com/sumneko/vscode-lua) and 
[stylua](https://github.com/JohnnyMorganz/StyLua) are predefined with this setup. 
The language server will be installed after the first launch of neovim as a result of defining 
it inside the `ensure_installed` property in *after/plugin/lsp/setup.lua*. Stylua needs
to be installed manually. See the github repo for more details. Once the formatter is installed, lua files are being
formatted upon saving the file. You can change the formatter options in the `stylua.toml` configuration file.

<br/>

--- 

<br/>

# Installation

Before you follow the installation process you may want to backup your existing nvim configuration. 
The following installation steps will otherwise overwrite them.

### Linux

Clone the repository to $HOME/.config

```bash
cd ~/.config
git clone https://github.com/olekatpyle/barebones-nvim.git nvim
```

<br/>

### First step after installation

Run the command `checkhealth` in commandmode, to identify any unsatisfied dependencies or misconfigurations
(in general, it is a good idea to run this command every now and then.).

<br/>

### Plugin suggestions for install, if you are new to neovim
+ [WhichKey](https://github.com/folke/which-key.nvim) displays possible key bindings of the command you started typing
+ A theme if you get annoyed by the barebones look. A good place to look for themes -> [Vim Color Schemes](https://vimcolorschemes.com/)
    - most theme repositories will give you detailed explanation on how to enable the theme inside your setup    
    - in general as an example: 

    ```vim
        " inside /lua/barebones/options.lua vim.cmd([[..]])
        colorscheme gruvbox-baby 
    ```

<br/>

---

<br/>

# File Tree
This setup has the following files tree:

```bash

nvim
├── after
│   ├── ftplugin
│   └── plugin
│       └── lsp
│           └── setup.lua
├── ftdetect
├── init.lua
├── lua
│   └── barebones
│       ├── keys.lua
│       ├── lsp
│       │   └── on_attach.lua
│       └── options.lua
├── plugin
│   ├── cmp.lua
│   ├── init.lua
│   ├── luasnip.lua
│   ├── mason.lua
│   ├── neotree.lua
│   ├── null.lua
│   ├── tree-sitter.lua
├── stylua.toml
└── undodir

```

### Explanation

In general there are five important directories to understand when it comes to configuring neovim.

#### `/lua`
Contains lua files that are being loaded **at** startup of neovim. This is the place
where you want to set your options for the editor, configure your keymaps aswell as other lua code, that 
needs to be loaded at start, i.e custom functionalities for your setup.

#### `/plugin`
Contains the packer init.lua to specify, which plugins to install. Further, the directory is being used
to define plugin specific configuration files, where the call to the plugins setup-function is being made (most
plugins need to be initialized with this call). Inside the setup-function, you can configure native settings 
for the plugin. If you want to add your own plugins, this is a good place to do so.

#### `/ftplugin`
If you have filetype specific plugins - i.e a plugin, that is only used with lua files - you should put the 
configuration file (like the ones in /plugin) inside this directory. This has the advantage, that the modules
defined inside /ftplugin are only being loaded, when you open a file of the specific filetype, making the
editor more performant.

#### `/ftdetect`
Inside **/ftdetect** you may put modules, that help you detect filetypes. Since there are some niche filetypes 
cruising around, neovim may not detect them. 


#### `/after` 
If you want to expand functionalities of plugins, you want to put those changes inside this directory.
This makes sure, that instead of replacing the native plugin, you add to it.

<br/>

--- 

# Options

All options for the editor are set in */lua/barebones/options.lua*. The comments for each option should be 
sufficient. Of course, if you need a detailed explanation, use the built-in help system in commandmode:

`:h <option_you_need_help_for>`

---

If more information is needed, something is unclear or something is not working correctly, 
please file an issue and feel free to ask. PROST!

