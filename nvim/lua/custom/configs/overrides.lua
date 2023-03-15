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
      "python",
    },
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",

    -- web dev stuff
    "eslint_d",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "tailwindcss-language-server",
  },
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
      quit_on_open = true,
    },
  },
}

M.luasnip = function()
  local options = { history = true, updateevents = "TextChanged,TextChangedI" }
  local ls = require("luasnip")

  local s = ls.snippet
  local t = ls.text_node
  local i = ls.insert_node
  local d = ls.dynamic_node
  local sn = ls.snippet_node
  
  ls.add_snippets('typescriptreact', {
    s('log', {
      t('console.log('),
      i(1, ''),
      t(','),
      i(2, ''),
      t(')'),
    }),
    s('int', {
      t('interface '),
      i(1, ''),
      t({"{","\t", "}"})
    }),
    s('rc', {
      t('export type '),
      i(1),
      t('Props = {}'),
      t({ '', 'export function ' }),
      d(2, function(args)
        -- the returned snippetNode doesn't need a position; it's inserted
        -- "inside" the dynamicNode.
        return sn(nil, {
          -- jump-indices are local to each snippetNode, so restart at 1.
          i(1, args[1]),
        })
      end, { 1 }),
      t('(){return null}'),
    }),
  })
end

return M
