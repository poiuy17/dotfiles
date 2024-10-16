return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_lsp = require("cmp_nvim_lsp")

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )


      vim.keymap.set("n", "gl", vim.diagnostic.open_float)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)

      -- diagnostic
      vim.diagnostic.config({ virtual_text = false, underline = false })


      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
        callback = function(event)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local keymap = function(mode, keys, func, desc)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end


          -- keymap('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          keymap('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          keymap('n', 'K', vim.lsp.buf.hover, 'hover')
          -- keymap("n", "gi", vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          -- keymap("n", "gh", vim.lsp.buf.signature_help, 'Signature Help')

          keymap('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          keymap('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          -- keymap('n', '<leader>gr', vim.lsp.buf.references, '[G]oto [R]eferences')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- enable mason and configure icons
      require("mason").setup({
        ui = {
          check_outdated_packages_on_open = true,
          border = "rounded",
          width = 0.8,
          height = 0.7,
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })


      mason_lspconfig.setup({
        -- list of servers for mason to install
        ensure_installed = {
          "lua_ls",
        },

        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          lua_ls = function()
            require('lspconfig').lua_ls.setup({
              capabilities = capabilities,
              settings = {

                Lua = {
                  hint = {
                    enable = true,
                    arrayIndex = "Auto",
                    await = true,
                    paramName = "All",
                    paramType = true,
                    semicolon = "SameLine",
                    setType = false,
                  },
                },
              }
            })
          end

        }
      })
    end,
  },
}
