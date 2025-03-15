return {
  { "zefei/cake16" },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true,
        styles = {            -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = { "italic" },
          keywords = { "bold" },
          operators = {},
        },
      })
      -- vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "phha/zenburn.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        search = { theme = "vscode" },
        styles = {
          comments = { italic = false },
          keywords = { italic = false, bold = true },
          functions = { italic = false, bold = true },
          variables = { italic = false },
        },
      })
      -- vim.cmd([[colorscheme nord]])
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        styles = {
          comments = { italic = true, bold = false },
          keywords = {
            italic = false,
            bold = true,
          },
          functions = { italic = true, bold = false },
        },
        lualine_bold = true,
      })
      -- vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        commentStyle = { italic = true },
        functionStyle = { italic = false, bold = true },
        keywordStyle = { italic = false, bold = true },
        statementStyle = { italic = false },
        transparent = true,
        background = {
          dark = "wave",
          light = "lotus",
        },
      })
    end,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "soft"
      vim.g.everforest_enable_italic = true
      vim.g.everforest_cursor = "green"
      vim.g.everforest_transparent_background = "2"
      vim.g.everforest_diagnostic_text_highlight = true
      vim.g.everforest_diagnostic_line_highlight = true
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_statusline_style = "default"
      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },
}
