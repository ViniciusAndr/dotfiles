local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#5b5b5b',
    },
    separator_selected = {
      fg = '#5b5b5b',
    },
    background = {
      fg = '#000000',
    },
    buffer_selected = {
      bold = true
    },
  }
})

vim.keymap.set('n', '<tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.keymap.set('n', '<s-tab>', '<cmd>BufferLineCyclePrev<cr>', {})
