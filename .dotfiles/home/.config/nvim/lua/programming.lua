local vim = vim
-- -- Filetypes
vim.filetype.add({
	extension = {
		xaml = "xml",
	},
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "Makefile", "makefile", "*.mk" },
	callback = function()
		vim.bo.tabstop = 8
		vim.bo.softtabstop = 0
		vim.bo.shiftwidth = 8
		vim.bo.expandtab = false
	end,
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- -- CoC (completion)
vim.g.coc_global_extensions = {
	'coc-marketplace',
	'coc-pairs',
	'coc-rust-analyzer',
	'coc-sh',
	'coc-sumneko-lua',
	'coc-pyright',
	'coc-markdownlint',
	'coc-css',
	'coc-stylelint',
	'coc-stylelintplus',
	'coc-clangd',
	'coc-cmake',
	'coc-html',
	'coc-json',
	'coc-git',
	'coc-prettier',
	'coc-yaml',
	'coc-toml',
	'coc-highlight',
	'@tcx4c70/coc-csharp',
	'coc-java',
	'coc-sql',
	'coc-eslint',
	'coc-db',
	'coc-xml',
	'coc-tsserver',
	'@yaegassy/coc-pug'
}

vim.g.coc_filetype_map = {
	pug = 'jade'
}

-- -- Dap (debugger)
local dap = require("dap")

-- C / C++ / Rust

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

local dap = require("dap")

dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		args = {}, -- provide arguments if needed
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
	{
		name = "Select and attach to process",
		type = "gdb",
		request = "attach",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		pid = function()
			local name = vim.fn.input('Executable name (filter): ')
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = '${workspaceFolder}'
	},
	{
		name = 'Attach to gdbserver :1234',
		type = 'gdb',
		request = 'attach',
		target = 'localhost:1234',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}'
	}
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_emit_files = 1
vim.g.rustfmt_fail_silently = 0


-- Bash / POSIX shell

dap.adapters.bashdb = {
	type = 'executable',
	command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
	name = 'bashdb',
}

dap.configurations.sh = {
	{
		type = 'bashdb',
		request = 'launch',
		name = "Launch file",
		showDebugOutput = true,
		pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
		pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
		trace = true,
		file = "${file}",
		program = "${file}",
		cwd = '${workspaceFolder}',
		pathCat = "cat",
		pathBash = "/bin/bash",
		pathMkfifo = "mkfifo",
		pathPkill = "pkill",
		args = {},
		argsString = '',
		env = {},
		terminalKind = "integrated",
	}
}


-- C#
dap.adapters.coreclr = {
	type = 'executable',
	command = 'netcoredbg',
	args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
		end,
	},
}

-- Go
dap.adapters.delve = function(callback, config)
	if config.mode == 'remote' and config.request == 'attach' then
		callback({
			type = 'server',
			host = config.host or '127.0.0.1',
			port = config.port or '38697'
		})
	else
		callback({
			type = 'server',
			port = '${port}',
			executable = {
				command = 'dlv',
				args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
				detached = vim.fn.has("win32") == 0,
			}
		})
	end
end

dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}"
	},
	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}"
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}"
	}
}
