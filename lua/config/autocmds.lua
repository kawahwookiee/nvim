-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "qf", "loclist" },
	command = [[nnoremap <buffer> <CR> <CR>:lclose<CR>]],
})

-- This is for stupid Starlark
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.star",
	command = "set filetype=python",
})
