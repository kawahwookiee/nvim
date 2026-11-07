local M = {}
function M.GetCurrentDir()
	return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
end

return M
