-- Matey Lualine theme
local colors = {
	white	= '#f5fae5',
	black	= '#0f170f',
	bg		= '#1a221a',
	color	= '#7ac04a',
	ncol	= '#639044',
	nfg		= '#e0f5c0',
	nbg		= '#364236',
	ndbg	= '#2a322a',
	purple  = '#8b8aa4',
	orange  = '#d6502b',
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

