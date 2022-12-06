local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local util = require('lspconfig.util')
local cmp_lsp = require('cmp_nvim_lsp')

local function create_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  vim.list_extend(
    capabilities.textDocument.completion.completionItem.resolveSupport.properties,
    {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  )
  return cmp_lsp.update_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
  if config.on_attach then
    config.on_attach =
      util.add_hook_after(config.on_attach, require('barebones.lsp.on_attach'))
  else
    config.on_attach = require('barebones.lsp.on_attach')
  end
  config.capabilities = vim.tbl_deep_extend(
    'force',
    create_capabilities(),
    config.capabilities or {}
  )
end)

require('mason-lspconfig').setup({
  ensure_installed = {
    'sumneko_lua',
  },
})

require('mason-lspconfig').setup_handlers({
  ['sumneko_lua'] = function()
    lspconfig.sumneko_lua.setup({
      settings = {
        Lua = {
          format = {
            enable = false,
          },
          hint = {
            enable = true,
            arrayIndex = 'Auto', -- "Enable", "Auto", "Disable"
            await = true,
            paramName = 'Literal', -- "All", "Literal", "Disable"
            paramType = true,
            semicolon = 'Disable', -- "All", "SameLine", "Disable"
            setType = true,
          },
          diagnostics = {
            globals = { 'P', 'vim', 'use' },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
})
