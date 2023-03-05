local on_attach = function(_, bufnr, isTsServer)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>d', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)

  -- format on save
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    buffer = bufnr,
    callback = function()
      if isTsServer == true then
        require('typescript').actions.removeUnused({ sync = true })
      end
      vim.lsp.buf.format()
    end
  })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = {
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end
}

require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup(lsp_config)
  end,
  lua_ls = function()
    require('lspconfig').lua_ls.setup(vim.tbl_extend('force', lsp_config, {
      settings = {
        lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }))
  end,
  tsserver = function()
    require('typescript').setup({
      server = vim.tbl_extend('force', lsp_config, {
        on_attach = function(_, bufnr)
          on_attach(_, bufnr, true)
        end,
        init_options = {
          preferences = {
            importModuleSpecifierPreference = 'project=relative',
            --jsxAttributeCompletionStyle = 'none'
          }
        }
      })
    })
  end,

  csserver = function()
    require'lspconfig'.cssmodules_ls.setup {
      on_attach = function (client, bufnr)
        client.server_capabilities.definitionProvider = false
        on_attach(client, bufnr)
      end
    }
  end
})

vim.keymap.set('n', '<leader>o', '<cmd>TypescriptOrganizeImports<cr>')
vim.keymap.set('n', 'aa', '<cmd>TypescriptAddMissingImports<cr>')
vim.keymap.set('n', '<leader>r', '<cmd>TypescriptRemoveUnused<cr>')
