local keymap = vim.keymap

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Quit, Save and Save&Quit
keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

-- Select all
keymap.set('n', '<c-a>', 'gg<S-v>G')

-- New Window
keymap.set('n', '<leader>t', ':tabedit')

-- Split window
keymap.set('n', '<leader>v', ':vsplit<Return><C-w>w', { silent = true })
keymap.set('n', '<leader>h', ':split<Return><C-w>w', { silent = true })

-- Move between windows
keymap.set('n', 'f', '<C-w>w')
keymap.set('', '<leader>a', '<C-w>h')
keymap.set('', '<leader>W', '<C-w>k')
keymap.set('', '<leader>s', '<C-w>j')
keymap.set('', '<leader>d', '<C-w>l')



keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')
