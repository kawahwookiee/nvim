return {
	"neovim/nvim-lspconfig",
	event = "LazyFile",
	dependencies = {
		"mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
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
			float = {
				scope = "line",
				border = "rounded",
				source = true,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				focusable = false,
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
}
