return {
	"stevearc/conform.nvim",
	lazy = true,
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>cF",
			function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
			end,
			mode = { "n", "v" },
			desc = "Format Injected Langs",
		},
	},
	opts = {
		formatters = {
			["dotenv-linter"] = {
				command = "dotenv-linter",
				args = { "fix", "--no-backup", "--quiet", "$FILENAME" },
				stdin = false,
			},
		},
		default_format_opts = {
			timeout_ms = 3000,
			async = false, -- not recommended to change
			quiet = false, -- not recommended to change
			lsp_format = "fallback", -- not recommended to change
		},
		formatters_by_ft = {
			lua = { "stylua" },
			fish = { "fish_indent" },
			sh = {},
			bash = {},
			zsh = {},
			toml = { "taplo" },
			rust = { "rustfmt" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			go = { "goimports", "gofumpt" },
			dockerfile = { "dockerfmt" },
			env = { "dotenv-linter" },
			markdown = { "markdownlint-cli2" },
			-- docker_language_server formats compose files; "*" formatters would otherwise block the LSP fallback.
			["yaml.docker-compose"] = { lsp_format = "first" },
			["*"] = { "trim_whitespace", "trim_newlines" },
		},
	},
}
