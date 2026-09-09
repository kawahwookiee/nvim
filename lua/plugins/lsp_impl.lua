return {
	"neovim/nvim-lspconfig",
	--- XXX: REMOVE AFTER PYREFLY IS FIXED
	init = function()
		local register_capability = vim.lsp.handlers["client/registerCapability"]

		vim.lsp.handlers["client/registerCapability"] = function(err, params, ctx, config)
			local client = vim.lsp.get_client_by_id(ctx.client_id)

			if client and client.name == "pyrefly" then
				for _, registration in ipairs(params.registrations or {}) do
					if registration.method == "workspace/didChangeWatchedFiles" then
						local options = registration.registerOptions
						options.watchers = options.watchers or {}

						vim.list_extend(options.watchers, {
							-- WatchKind 7 = create | change | delete.
							{ globPattern = "**/*.py", kind = 7 },
							{ globPattern = "**/*.pyi", kind = 7 },
							{ globPattern = "**/pyproject.toml", kind = 7 },
							{ globPattern = "**/pyrefly.toml", kind = 7 },
						})
					end
				end
			end

			return register_capability(err, params, ctx, config)
		end
	end,
	--- XXX: REMOVE AFTER PYREFLY IS FIXED
	---@class PluginLspOpts
	opts = {
		servers = {
			mojo = {
				settings = {
					cmd = { "mojo-lsp-server" },
					filetypes = { "mojo" },
					rootMarkers = { ".git", "pyproject.toml", ".venv" },
				},
			},
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
				root_markers = { "pyproject.toml", ".venv" },
				settings = {
					python = {
						pyrefly = {
							displayTypeErrors = "force-on",
							diagnosticMode = "workspace",
						},
					},
				},
			},
			---@type vim.lsp.Config
			ty = {
				mason = false,
				root_markers = { "pyproject.toml", ".venv" },
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
