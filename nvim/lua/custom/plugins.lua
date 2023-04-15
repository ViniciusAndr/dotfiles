local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  
  {
    "windwp/nvim-ts-autotag",
    lazy = false
  },

  {
    "p00f/nvim-ts-rainbow",
    lazy = false,
  },
  
  {
    "axelvc/template-string.nvim",
    config = function (_, opts)
      require('template-string').setup({
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' },
        jsx_brackets = true,
        remove_template_string = false,
        restore_quotes = {
          normal = [[']],
          jsx = [["]],
        },
      })
    end,
    lazy = false
  },

  {
    "tpope/vim-obsession", 
    lazy = false
  },

  {
    'MattesGroeger/vim-bookmarks',
    lazy = false
  },
  
  { 
    'tom-anders/telescope-vim-bookmarks.nvim',
    lazy = false
  },

  {
    "rmagatti/alternate-toggler"
  },

  {
    "tpope/vim-surround", lazy = false
  },

  {
    "kdheepak/lazygit.nvim", lazy = false
  },
  {
    'gelguy/wilder.nvim', 
    config = function (_, opts)
      local wilder = require('wilder')
      wilder.setup({modes = {':', '/', '?'}})
      wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_palette_theme({
          -- 'single', 'double', 'rounded' or 'solid'
          -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
          border = 'rounded',
          max_height = '75%',      -- max height of the palette
          min_height = 0,          -- set to the same as 'max_height' for a fixed height window
          prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
          reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
        })
      ))
    end, 
    lazy = false
  }
}

return plugins
