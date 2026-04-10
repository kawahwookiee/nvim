return {
	"neovim/nvim-lspconfig",
	---@class PluginLspOpts
	opts = {
		servers = {
			---@type vim.lsp.Config
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							runBuildScripts = true,
						},
						-- Add clippy lints for Rust
						checkOnSave = false,
						-- checkOnSave = {
						--   allFeatures = false,
						--   command = "clippy",
						--   extraArgs = { "--no-deps" },
						-- },
						files = {
							excludeDirs = { "target", ".git" },
						},
						procMacro = {
							enable = true,
							ignored = {
								-- ["async-trait"] = { "async_trait" },
								-- ["napi-derive"] = { "napi" },
								-- ["async-recursion"] = { "async_recursion" },
							},
						},
					},
				},
			},
			---@type vim.lsp.Config
			lua_ls = {
				-- mason = false, -- set to false if you don't want this server to be installed with mason
				-- Use this to add any additional keymaps
				-- for specific lsp servers
				-- keys = {},
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = true,
						},
						codeLens = {
							enable = true,
						},
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
						doc = {
							privateName = { "^_" },
						},
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
					},
				},
			},
			---@type vim.lsp.Config
			basedpyright = {
				mason = false,
				settings = {
					basedpyright = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							autoImportCompletions = true,
							inlayHints = false,
							typeCheckingMode = "standard",
						},
					},
				},
			},
			---@type vim.lsp.Config
			pyrefly = {
				mason = false,
				settings = {
					root_markers = {
						"pyproject.toml",
						".venv",
						"setup.py",
						"setup.cfg",
						"requirements.txt",
					},
					python = {
						pyrefly = {
							displayTypeError = "force-on",
							diagnosticMode = "workspace",
						},
					},
				},
			},
			---@type vim.lsp.Config
			ty = {
				mason = false,
				settings = {
					ty = {
						diagnosticMode = "workspace",
						completions = { autoImport = true },
						inlayHints = { variableTypes = false, callArgumentNames = false },
					},
				},
			},
			---@type vim.lsp.Config
			gopls = {
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						-- hints = {
						--   assignVariableTypes = true,
						--   compositeLiteralFields = true,
						--   compositeLiteralTypes = true,
						--   constantValues = true,
						--   functionTypeParameters = true,
						--   parameterNames = true,
						--   rangeVariableTypes = true,
						-- },
						analyses = {
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
						semanticTokens = true,
					},
				},
			},
		},
	},
}
