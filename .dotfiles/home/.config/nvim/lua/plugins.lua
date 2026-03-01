-- plugins/appearance.lua
return {
	-- Custom line at the bottom
	"nvim-lualine/lualine.nvim",
	-- Show colors whenever there is a hex, color name, etc...
	"ap/vim-css-color",
	-- plugins/basics.lua
	{ 'nvim-mini/mini.nvim', version = '*' },
	-- Show popups with keybind helps
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix"
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
	-- plugins/ergonomics.lua
	-- Harpoon, file switcher to get where I want with the least keystrokes
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- plugins/programming.lua
	-- Conquer of Completion: autocomplete/LSP
	{ 'neoclide/coc.nvim',   branch = 'release' },
	-- Asynchronous Lint Engine (syntax checker)
	-- 'dense-analysis/ale',
	-- Rust for Vim
	'rust-lang/rust.vim',
	'LevelOneNino/vim-pug',
	-- C# for Vim
	{
		"GustavEikaas/easy-dotnet.nvim",
		dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
		ft = { "cs", "csproj", "sln", "slnx", "props", "csx", "targets" },
		cmd = "Dotnet",
		config = function()
			local dotnet = require "easy-dotnet"
			dotnet.setup {
				debugger = {
					--name if netcoredbg is in PATH or full path like 'C:\Users\gusta\AppData\Local\nvim-data\mason\bin\netcoredbg.cmd'
					bin_path = "netcoredbg",
				}
			}
		end
	},
	-- Tree Sitter, highlighting, folding, etc...
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		branch = 'master',
		build = ':TSUpdate'
	},
	-- Tree Sitter Context, show what function I'm inside at the top
	"nvim-treesitter/nvim-treesitter-context",
	-- Debugger
	"mfussenegger/nvim-dap",
	-- Remote editing with ssh
	"nosduco/remote-sshfs.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
}
