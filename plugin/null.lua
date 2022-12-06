--------
-- Null-ls configuration
-- Source: https://github.com/jose-elias-alvarez/null-ls.nvim
--------

local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
  debug = false,
  sources = {
    formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
})
