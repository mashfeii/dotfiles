return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  event = {
    "BufReadPre /home/mashfeii/.notes/*.md",
    "BufNewFile /home/mashfeii/.notes/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal/work",
        path = "~/.notes/",
      },
    },
  },
}
