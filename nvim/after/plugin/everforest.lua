vim.g.everforest_diagnostic_line_highlight = 1
vim.g.everforest_transparent_background = 2
vim.cmd('colorscheme everforest')
vim.fn.sign_define({
	{
		name = 'DiagnosticSignError',
		text = '',
		texthl = 'DiagnosticSignError',
		linehl = 'ErrorLine',
	},
	{
		name = 'DiagnosticSignWarn',
		text = '',
		texthl = 'DiagnosticSignWarn',
		linehl = 'WarningLine',
	},
	{
		name = 'DiagnosticSignInfo',
		text = '',
		texthl = 'DiagnosticSignInfo',
		linehl = 'InfoLine',
	},
	{
		name = 'DiagnosticSignHint',
		text = '',
		texthl = 'DiagnosticSignHint',
		linehl = 'HintLine',
	},
})
