local M = {}

function M.GetCurrentDir()
  print(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h"))
  return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h")
end

return M
