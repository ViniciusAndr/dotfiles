local keymap = vim.keymap.set

require('lspsaga').setup({
  ui = {
    border = 'rounded',
  }
})

local diagnostic = require('lspsaga.diagnostic')

keymap("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>")
keymap("n", "gd", "<cmd>Lspsaga lsp_finder<CR>")
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")

--keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

local codeaction = require('lspsaga.codeaction')
keymap("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
keymap("v", "<leader>ca", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  codeaction:range_code_action()
end, { silent = true })
