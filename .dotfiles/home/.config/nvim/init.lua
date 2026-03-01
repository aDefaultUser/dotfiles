local vim = vim -- Make the warnings shut up
--[[


######       ########                               #########  ####################          ######
 ##   -#      #-  ##                                 ##   #      #   #  +...+# #   -+#    ##-   #
 ##     ##    #-  ##  #+##########+   +##########++  ##   #      #   #         #      #  #      #
 ##       #   #-  ## ++            +++             + ##   #      #   #  ###### #       ##       #
 ##        --##-  ## #+  #######   ###   +----++   # ##   #      #   #  #   ## #                #
 ##...........#+..## ##..#######...###...#    ##...# ##...#      #...#  #...## #................#
 ##---#-----------## ##--------------#---#    ##---# ##---#    ##-----  #---## #-----.----..----#
 ##+++# ---+++++++## ++++++#  #+++++++++++## ###++++ ##+++#  ##+++---   #+++## #+++## .--.  #+++#
 ##+++#    --+++++##  --++++##++++-   -+++++#++++--  ##+++###++++-      #+++## #+++##       #+++#
 ######      -######    -#######--     --#######-    ##########--       ####+# ######       +####
 #####-       -+####     --####-         -####+-     #########-         ####-- ####--       -####
 ##-             -##        --              -        --------           #--    #--            --#


                                                                                                ]]


-- Set leader to tab
vim.g.mapleader = '\t'

-- Set Joplin token before loading plugins
pcall(require, 'tokens.joplin') -- vim.g.joplin_token set in lua/joplin-token.lua

-- Lazy (plugin manager)
require('loadlazy') -- Load lazy, install it if it's missing

-- Disable providers I don't use
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Debugger
local dap = require "dap"

-- Keymaps for controlling the debugger
vim.keymap.set("n", "q", function()
	dap.terminate()
	dap.clear_breakpoints()
end, { desc = "Terminate and clear breakpoints" })

vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/continue debugging" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dO", dap.step_over, { desc = "Step over (alt)" })
vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle DAP REPL" })
vim.keymap.set("n", "<leader>dj", dap.down, { desc = "Go down stack frame" })
vim.keymap.set("n", "<leader>dk", dap.up, { desc = "Go up stack frame" })

-- -- Misc
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' } -- menu selection
vim.opt.mouse = 'a'                                     -- allow the mouse to be used

-- UI config
vim.opt.number = true         -- show number line
vim.opt.relativenumber = true -- show the number line relatively
vim.opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true     -- open new vertical split bottom
vim.opt.splitright = true     -- open new horizontal splits right
vim.opt.showmode = false      -- disable the -- INSERT -- line at the bottom since lualine already has that
vim.opt.updatetime = 300      -- Faster update time (default 4s which is awful)
vim.opt.signcolumn = "yes"    -- Always show the signcolumn

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- Column
vim.opt.colorcolumn = "81,101,121" -- show a line at coulumn 101 (Rust allows max 100 chars per line)

-- Tab
vim.opt.tabstop = 4       -- number of visual spaces per TAB
vim.opt.softtabstop = 4   -- number of spacesin tab when editing
vim.opt.shiftwidth = 2    -- insert 2 spaces on a tab
vim.opt.expandtab = false -- I hate spaces

-- Indentation
vim.opt.smartindent = true

-- Surround selection with braces
require('mini.surround').setup()

-- Lualine
require('lualine').setup {
	options = {
		theme = 'auto',
		section_separators = '|',
		component_separators = '-'
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_c = { 'windows', 'tabs' },
		lualine_x = { 'g:coc_status', 'encoding', 'fileformat', 'filetype' }
	}
}
require('lualine').setup()

-- Harpoon
local harpoon = require('harpoon')
harpoon:setup({})
-- Highlight current file in the harpoon buffer list
local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

vim.keymap.set("n", "<leader>o", function() harpoon:list():add() end, { desc = "Add to harpoon" })
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
	{ desc = "Open harpoon window" })


-- Telescope and sshfs
require('telescope').setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			height = vim.o.lines, -- maximally available lines
			width = vim.o.columns, -- maximally available columns
			prompt_position = "bottom",
		},
	},
})
require('remote-sshfs').setup {
	connections = {
		mounts = {
			unmount_on_exit = false
		},
		handlers = {
			on_disconnect = {
				clean_mount_folders = false
			}
		}
	},
	ui = {
		confirm = {
			connect = false,
			change_dir = false,
		}
	}
}
local builtin = require('telescope.builtin')
local connections = require("remote-sshfs.connections")
local sshapi = require('remote-sshfs.api')
vim.keymap.set('n', '<leader>f', function()
	if connections.is_connected() then
		sshapi.find_files()
	else
		builtin.find_files()
	end
end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>h', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
	{ desc = 'Telescope find hidden files' })
vim.keymap.set('n', '<leader>g', function()
	if connections.is_connected() then
		sshapi.live_grep()
	else
		builtin.live_grep()
	end
end, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>q', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>rc', sshapi.connect, { desc = 'Connect with SSH' })
vim.keymap.set('n', '<leader>rd', sshapi.disconnect, { desc = 'Disconnect SSH' })
vim.keymap.set('n', '<leader>re', sshapi.edit, { desc = 'Edit SSH config' })
require('telescope').load_extension 'remote-sshfs'


-- WhichKey (popup to see keybinds)
require('which-key')

-- Joplin integration
vim.keymap.set("n", "<leader>j", ":Joplin<cr>50<c-w>>", { noremap = true, silent = true, desc = "Open Joplin" })

-- Misc

-- Prompt to create directory before saving if it doesn't exist
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(event)
		local file = event.file
		local dir = vim.fn.fnamemodify(file, ":h")
		if (vim.fn.isdirectory(dir) == 0) then
			local choice = vim.fn.confirm("Directory does not exist. Create it?", "&Yes\n&No", 2)
			if choice == 1 then
				vim.fn.mkdir(dir, "p")
				vim.notify("Created directory: " .. dir, vim.log.levels.INFO)
			else
				vim.notify("Aborted write: directory not created.", vim.log.levels.WARN)
				vim.cmd("echo '' | redraw") -- Prevents prompt persistence
				return                  -- Skip write if user aborts
			end
		end
	end
})

-- -- Remaps

-- Ability to move in insert mode with Ctrl+hjkl
vim.keymap.set('i', '<C-h>', '<Left>', { silent = true })
vim.keymap.set('i', '<C-j>', '<Down>', { silent = true })
vim.keymap.set('i', '<C-k>', '<Up>', { silent = true })
vim.keymap.set('i', '<C-l>', '<Right>', { silent = true })

-- Move around panes in normal mode with Ctrl+hjkl
vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<cr>', { silent = true })
vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<cr>', { silent = true })
vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<cr>', { silent = true })
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<cr>', { silent = true })

-- Completion binds

function _G.check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Ctrl + Space triggers completion
vim.keymap.set("i", "<c-space>", "coc#refresh()",
	{ silent = true, expr = true, noremap = true, replace_keycodes = false })

vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
	{ silent = true, noremap = true, expr = true, replace_keycodes = false })
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
	{ silent = true, noremap = true, expr = true, replace_keycodes = false })

-- Confirm completion with enter
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
	{ silent = true, expr = true, noremap = true, replace_keycodes = false })
-- Apply codeAction to the selected region
vim.keymap.set("x", "<leader>vc", "<Plug>(coc-codeaction-selected)",
	{ silent = true, nowait = true, desc = "Apply code action to selection" })
vim.keymap.set("n", "<leader>vc", "<Plug>(coc-codeaction-selected)",
	{ silent = true, nowait = true, desc = "Apply code action to selection" })
-- Remap keys for apply code actions at the cursor position.
vim.keymap.set("n", "<leader>cc", "<Plug>(coc-codeaction-cursor)",
	{ silent = true, nowait = true, desc = "Apply code actions at the cursor position" })
-- Apply the most preferred quickfix action on the current line.
vim.keymap.set("n", "<leader>lf", "<Plug>(coc-fix-current)",
	{ silent = true, nowait = true, desc = "Apply the most preferred quickfix on the current line" })
-- Format selected code
vim.keymap.set("x", "<leader>vf", "<Plug>(coc-format-selection)", { silent = true, desc = "Format selected code" })
vim.keymap.set("n", "<leader>vf", "<Plug>(coc-format-selection)", { silent = true, desc = "Format selected code" })
-- Remap keys for apply refactor code actions.
vim.keymap.set("n", "<leader>rr", "<Plug>(coc-codeaction-refactor)",
	{ silent = true, desc = "Apply refactor code action" })
vim.keymap.set("x", "<leader>vr", "<Plug>(coc-codeaction-refactor-selected)",
	{ silent = true, desc = "Apply refactor code action to selection" })
vim.keymap.set("n", "<leader>vr", "<Plug>(coc-codeaction-refactor-selected)",
	{ silent = true, desc = "Apply refactor code action to selection" })

-- Programming stuff setup
require('programming')

-- Load the theme
require('mini.indentscope').setup({ symbol = '║' })
require('mini.tabline').setup()
require('themes.coomf').load()
vim.opt.termguicolors = true

-- Helix bindings
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/vimscript/binds.vim')
