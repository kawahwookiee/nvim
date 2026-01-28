-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.api.nvim_command("set mouse=")
vim.opt.clipboard = "unnamed,unnamedplus"
vim.o.termguicolors = true
vim.g.lazyvim_picker = "snacks"
vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver100-Cursor,r-cr-o:hor20"
vim.g.python3_host_prog = "$HOME/.venvs/neovim/bin/python3"

-- [[ Context ]]
vim.opt.relativenumber = false
vim.opt.scrolloff = 4 -- int:  Min num lines of context
vim.opt.signcolumn = "yes:1" -- str:  Show the sign column
vim.opt.statuscolumn = "%l %s"
vim.opt.synmaxcol = 500
vim.opt.wrap = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 250

-- [[ Filetypes ]]
vim.opt.encoding = "utf8" -- str:  String encoding to use
vim.opt.fileencoding = "utf8" -- str:  File encoding to use

-- [[ Search ]]
vim.opt.ignorecase = true -- bool: Ignore case in search patterns
vim.opt.smartcase = true -- bool: Override ignorecase if search contains capitals
vim.opt.incsearch = true -- bool: Use incremental search
vim.opt.hlsearch = true -- bool: Highlight search matches

-- [[ Whitespace ]]
vim.opt.expandtab = true -- bool: Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- num:  Size of an indent
vim.opt.softtabstop = 2 -- num:  Number of spaces tabs count for in insert mode
vim.opt.tabstop = 2 -- num:  Number of spaces tabs count for
