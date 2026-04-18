return {
	"saghen/blink.cmp",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"exact",
				-- defaults
				"score",
				"sort_text",
			},
		},
		sources = {
			default = { "lsp", "path", "snippets" },
			per_filetype = {
				lua = { inherit_defaults = true, "lazydev" },
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100, -- show at a higher priority than lsp
				},
			},
			compat = {},
		},
		completion = { list = { max_items = 10, selection = { preselect = true } }, keyword = { range = "full" } },
		keymap = {
			preset = "enter",
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_next()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					if not cmp.snippet_active() then
						return cmp.select_prev()
					end
				end,
				"snippet_backward",
				"fallback",
			},
			["<Esc>"] = { "cancel", "fallback" },
			["C-e"] = { "cancel", "fallback" },
			["<Left>"] = { "cancel", "fallback" },
			["<Right>"] = { "cancel", "fallback" },
		},
	},
}
