local diagnostic_float_win

local function open_diagnostic_float(bufnr, replace)
	if not replace and diagnostic_float_win and vim.api.nvim_win_is_valid(diagnostic_float_win) then
		return
	end

	local _, winid = vim.diagnostic.open_float({
		bufnr = bufnr,
		scope = "line",
		focus = false,
	})

	if not winid then
		diagnostic_float_win = nil
		return
	end

	diagnostic_float_win = winid

	local statusline_height = vim.o.laststatus == 0 and 0 or 1

	vim.api.nvim_win_set_config(winid, {
		relative = "editor",
		anchor = "SE",
		row = vim.o.lines - vim.o.cmdheight - statusline_height,
		col = vim.o.columns,
	})
end

local diagnostic_float_group = vim.api.nvim_create_augroup("bottom_right_diagnostic_float", { clear = true })

vim.api.nvim_create_autocmd("CursorHold", {
	group = diagnostic_float_group,
	callback = function(args)
		open_diagnostic_float(args.buf, false)
	end,
})

return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		opts_extend = { "servers.*.keys" },
		---@class PluginLspOpts
		opts = {
			---@type vim.diagnostic.Opts
			diagnostics = {
				underline = true,
				update_in_insert = false,
				---@type vim.diagnostic.Opts.Signs
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.INFO] = "",
					},
					numhl = {
						[vim.diagnostic.severity.WARN] = "WarningMsg",
						[vim.diagnostic.severity.ERROR] = "ErrorMsg",
						[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
						[vim.diagnostic.severity.HINT] = "DiagnosticHint",
					},
				},
				-- Resolved each time the float opens, so resizing Neovim
				-- also updates the width limit.
				float = function()
					return {
						scope = "line",
						border = "rounded",
						source = true,
						close_events = {
							"BufLeave",
							"CursorMoved",
							"InsertEnter",
							"FocusLost",
						},
						focusable = false,

						-- Subtract two cells for the rounded border.
						max_width = math.max(1, math.floor(vim.o.columns / 2) - 2),
					}
				end,

				-- Called by vim.diagnostic.jump() after moving the cursor.
				jump = {
					on_jump = function(_, bufnr)
						open_diagnostic_float(bufnr, true)
					end,
				},
				virtual_text = false,
				severity_sort = true,
			},
			inlay_hints = {
				enabled = false,
			},
			codelens = {
				enabled = false,
			},
			document_highlight = {
				enabled = true,
			},
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
		},
	},
}
