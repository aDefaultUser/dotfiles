-- Tealyyy Lualine theme
local colors = {
	white	= '#f0ffff',
	black	= '#0a1a17',
	bg		= '#1a2623',
	color	= '#10ddb5',
	ncol	= '#76b8ab',
	nfg		= '#c4f3e5',
	nbg		= '#3a4d49',
	ndbg	= '#2a3b37',
	purple  = '#8a63b3',
	orange  = '#d55227',
}

return {
  normal = {
    a = { bg = colors.ncol, fg = colors.black, gui = 'bold' },
    b = { bg = colors.ndbg, fg = colors.nfg },
    c = { bg = colors.bg, fg = colors.nfg },
  },
  insert = {
    a = { bg = colors.color, fg = colors.black, gui = 'bold' },
    b = { bg = colors.nbg, fg = colors.nfg },
    c = { bg = colors.ndbg, fg = colors.nfg },
  },
  visual = {
    a = { bg = colors.purple, fg = colors.black, gui = 'bold' },
    b = { bg = colors.ndbg, fg = colors.nfg },
    c = { bg = colors.nbg, fg = colors.nfg },
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

