return {
  { "barreiroleo/ltex-extra.nvim" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.buf_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.css_variables.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.cssmodules_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.marksman.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })
      lspconfig.hls.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.cmake.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.golangci_lint_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.texlab.setup({
        capabilities = capabilities,
      })
      lspconfig.ltex.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          require("ltex_extra").setup({
            load_langs = { "en-US", "ru-RU" },
            path = vim.fn.expand("~") .. "/.local/share/ltex",
          })
        end,
        settings = {
          ltex = {
            enabled = { "latex", "markdown" },
            additionalRules = {
              motherTongue = "ru-RU",
            },
          },
        },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.cmake.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
