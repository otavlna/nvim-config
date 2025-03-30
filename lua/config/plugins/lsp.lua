return {
  {
    "williamboman/mason.nvim",
    opts = {},
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
              require("lspconfig")[server_name].setup {}
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            -- TODO: maybe call this for all lsp servers https://cmp.saghen.dev/installation#lsp-capabilities
            ["lua_ls"] = function()
              local capabilities = require('blink.cmp').get_lsp_capabilities()
              require("lspconfig").lua_ls.setup { capabilities = capabilities }
            end
          }
        end,
        dependencies = {
          {
            "neovim/nvim-lspconfig",
          }
        },
      },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load lazily on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      }
    }
  }
}
