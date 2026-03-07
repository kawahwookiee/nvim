local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Global Options ]]
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ "Mofiqul/vscode.nvim", name = "vscode", lazy = false, priority = 1000 },
		{ "cormacrelf/dark-notify", lazy = false }, -- for macos
		-- { "f-person/auto-dark-mode.nvim", lazy=false}, -- for linux
		{ "LazyVim/LazyVim", opts = { colorscheme = "vscode" } },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			cmd = "LazyDev",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					{ path = "LazyVim", words = { "LazyVim" } },
					{ path = "snacks.nvim", words = { "Snacks" } },
					{ path = "lazy.nvim", words = { "LazyVim" } },
				},
			},
		},
		{
			"nvim-lualine/lualine.nvim",
			lazy = false,
			opts = function()
				local opts = {
					options = {
						theme = "auto",
						section_separators = "",
						component_separators = "",
					},
					sections = {
						lualine_c = {
							{ "filename", path = 3 },
							{ "navic", color_correction = "dynamic" },
						},
					},
					extensions = { "lazy" },
				}
				vim.o.laststatus = vim.g.lualine_laststatus
				return opts
			end,
		},
		{
			"SmiteshP/nvim-navic",
			lazy = true,
			init = function()
				vim.g.navic_silence = true
			end,
			opts = function()
				Snacks.util.lsp.on({ method = "textDocument/documentSymbol" }, function(buffer, client)
					require("nvim-navic").attach(client, buffer)
				end)
				return {
					separator = " ",
					highlight = true,
					depth_limit = 5,
					icons = LazyVim.config.icons.kinds,
					lazy_update_context = true,
				}
			end,
		},
		{ import = "plugins" },
	},
	defaults = {
		lazy = true,
		version = false,
	},
	install = { colorscheme = { "vscode" } },
	checker = {
		enabled = false,
		notify = false,
	},
})
