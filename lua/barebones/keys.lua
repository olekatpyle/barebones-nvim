-- Setup your key mappings inside this file

-- wrapper function
function map(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Leader
map('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- save and quit
map('n', '<Leader>w', ':w<CR>', { silent = true, noremap = true })
map('n', '<Leader>qq', ':q<CR>', { silent = true, noremap = true })
map('n', '<Leader>Q', ':q!<CR>', { silent = true, noremap = true })
map('n', '<Leader>q', ':bd<CR>', { silent = true, noremap = true })
map('n', '<Leader>s', '<cmd>so%<CR>', { silent = true, noremap = true })

-- basic window movement
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- indenting in visual mode
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- <ESC> alternative
map('i', 'jk', '<ESC>', { noremap = true, silent = true })
map('i', 'kj', '<ESC>', { noremap = true, silent = true })
map('i', 'KJ', '<ESC>', { noremap = true, silent = true })
map('i', 'JK', '<ESC>', { noremap = true, silent = true })

-- Tab switch buffer
map('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
map('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- NeoTree explorer
map('n', '<Leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
