-- Coomf Lualine theme
local colors = {
	white  = '#e6fff9',
	black  = '#0b0a07',
	bg     = '#0b0a07',
	color  = '#b32809',
	ncol   = '#6cb309',
	nfg    = '#c8faf0',
	nbg    = '#262319',
	ndbg   = '#1a1812',
	purple = '#885dff',
	orange = '#b38b09',
}

return {
	normal = {
		a = { bg = colors.ncol, fg = colors.black, gui = 'bold' },
		b = { bg = colors.ndbg, fg = colors.nfg },
		c = { bg = colors.bg, fg = colors.nfg },
	},
	insert = {
		a = { bg = colors.color, fg = colors.white, gui = 'bold' },
		b = { bg = colors.nbg, fg = colors.nfg },
		c = { bg = colors.ndbg, fg = colors.nfg },
	},
	visual = {
		a = { bg = colors.purple, fg = colors.black, gui = 'bold' },
		b = { bg = colors.ndbg, fg = colors.nfg },
		c = { bg = colors.bg, fg = colors.nfg },
	},
	replace = {
		a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
		b = { bg = colors.nbg, fg = colors.nfg },
		c = { bg = colors.ndbg, fg = colors.nfg },
	},
	command = {
		a = { bg = colors.white, fg = colors.black, gui = 'bold' },
		b = { bg = colors.ndbg, fg = colors.nfg },
		c = { bg = colors.nbg, fg = colors.nfg },
	},
	inactive = {
		a = { bg = colors.nbg, fg = colors.nfg, gui = 'bold' },
		b = { bg = colors.nbg, fg = colors.nfg },
		c = { bg = colors.nbg, fg = colors.nfg },
	},
}
