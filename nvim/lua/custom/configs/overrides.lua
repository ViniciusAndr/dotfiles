local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "markdown",
    "markdown_inline",
    "tsx",
    "json",
  },
  indent = {
    enable = true,
    disable = {
      "python"
    },
  },
  autotag = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua_ls",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "tailwindcss",
  },
  automatic_installation = true,
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  actions = {
		open_file = {
			quit_on_open = true
		}
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = 'H',
			info = 'I',
			warning = 'W',
			error = 'E'
		}
	}
}

return M
