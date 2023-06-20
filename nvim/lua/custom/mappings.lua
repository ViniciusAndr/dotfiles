---@type MappingsTable
local M = {}

M.general = {
  n = {
    --Base
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["dw"] = { 'vb"_d' },
    ["<leader>q"] = { "<cmd>q<cr>" },
    ["<leader>w"] = { "<cmd>w<cr>" },
    ["<leader>x"] = { "<cmd>x<cr>" },
    ["<A-j>"] = { "<cmd>m +1<cr>" },
    ["<A-k>"] = { "<cmd>m -2<cr>" },
    ["<c-a>"] = { "gg<S-v>G" },
    ["f"] = { "<C-w>w" },
    ["dq"] = { 'di"' },
    ["qd"] = { "di'" },

    --NvimTree
    ["<C-e>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    --LSP
    ["<leader>d"] = { "<cmd>Telescope lsp_document_symbols<cr>", opts = { noremap = true, silent = true } },

    --bufferline
    ["<leader>c"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },

    ["<leader>a"] = { "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>" },
    ["<leader>ta"] = { "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>" },
    ["<leader>gl"] = { "<cmd>LazyGit<CR>" },
  },
}

-- more keybinds!

return M
