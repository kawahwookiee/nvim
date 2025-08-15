local lspconfig = require("lspconfig")
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    servers = {
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
      ruff = {
        autostart = false,
      },
      pyright = {
        root_dir = function(fname)
          return lspconfig.util.root_pattern("pyproject.toml", ".git", "setup.py", "setup.cfg", "requirements.txt")(
            fname
          ) or vim.fs.dirname(fname)
        end,
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              autoImportCompletions = true,
              typeCheckingMode = "standard",
              diagnosticMode = "workspace",
            },
          },
        },
      },
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
    setup = {
      -- gopls = function(_, opts)
      --   -- workaround for gopls not supporting semanticTokensProvider
      --   -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
      --   LazyVim.lsp.on_attach(function(client, _)
      --     if not client.server_capabilities.semanticTokensProvider then
      --       local semantic = client.config.capabilities.textDocument.semanticTokens
      --       client.server_capabilities.semanticTokensProvider = {
      --         full = true,
      --         legend = {
      --           tokenTypes = semantic.tokenTypes,
      --           tokenModifiers = semantic.tokenModifiers,
      --         },
      --         range = true,
      --       }
      --     end
      --   end, "gopls")
      --   -- end workaround
      -- end,
    },
  },
}
