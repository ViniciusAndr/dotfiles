---@type MappingsTable
local M = {}

M.general = {
  n = {
    --Base
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["dw"] = { 'vb"_d' },
    ["<leader>q"] = { '<cmd>q<cr>' },
    ["<leader>w"] = { '<cmd>w<cr>' },
    ["<leader>x"] = { '<cmd>x<cr>' },
    ["<c-a>"] = { 'gg<S-v>G' },
    ["<leader>t"] = { ':tabedit' },
    ["f"] = {"<C-w>w"},
    --NvimTree
    ["<C-e>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    --LSP
    ["<leader>d"] = {'<cmd>Telescope lsp_document_symbols<cr>', opts = {noremap = true, silent = true}},

    --bufferline
    ["<leader>c"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

-- more keybinds!

return M
