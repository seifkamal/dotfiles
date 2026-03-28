return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    vim.filetype.add({
      extension = {
        mdx = "markdown.mdx",
      }
    })

    local lspconfig = require("lspconfig")
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_lsp.default_capabilities()

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "eslint",
        "html",
        "cssls",
        "jsonls",
        "pyright",
      },
      handlers = {
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities
          }
        end,
        lua_ls = function()
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              -- Configure lua for vim
              Lua = {
                runtime = { version = "LuaJIT" },
                workspace = {
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                }
              }
            },
          }
        end,
        eslint = function ()
          lspconfig.eslint.setup {
            capabilities = capabilities,
            settings = {
              runtime = "node",
            },
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
            end,
          }
        end,
        pyright = function ()
          lspconfig.pyright.setup {
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  diagnosticSeverityOverrides = {
                    reportMissingModuleSource = "none",
                  },
                },
              },
            },
          }
        end
      },
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources(
        { { name = 'nvim_lsp' } },
        { { name = 'buffer' } }
      )
    })

    -- Style
    local float_ui_border = "rounded"

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = float_ui_border,
        source = "if_many",
        header = "",
        prefix = "",
      },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = float_ui_border }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = float_ui_border }
    )

    require('lspconfig.ui.windows').default_options = {
      border = float_ui_border,
    }

    vim.cmd("hi! link LspInfoBorder FloatBorder")
    vim.cmd("hi! link CmpItemKindKeyword Keyword")
    vim.cmd("hi! link CmpItemKindModule @module")
    vim.cmd("hi! link CmpItemKindFunction Function")
    vim.cmd("hi! link CmpItemKindMethod Method")
    vim.cmd("hi! link CmpItemKindVariable Variable")
    vim.cmd("hi! link CmpItemKindClass Class")
    vim.cmd("hi! link CmpItemKindConstant Constant")
  end,
}
