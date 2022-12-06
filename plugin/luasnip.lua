--------
-- LuaSnip configuration
-- Source: https://github.com/L3MON4D3/LuaSnip
--------

local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = false,
  ext_opts = {
    [types.choiceNode] = {
      acitve = {
        virt_text = { { '<-', 'Error' } },
      },
    },
  },
})

vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set('i', '<c-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node

ls.add_snippets('all', {
  s(
    'todo',
    fmt([[{} {}: {}]], {
      c(1, {
        t('TODO '),
        t('FIXME '),
        t('TODONT '),
        t('NOTE '),
      }),
      f(function()
        return os.date('%D - %H:%M')
      end),
      i(2, 'message'),
    })
  ),
})

require('luasnip.loaders.from_vscode').lazy_load()
