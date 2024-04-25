return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local tsconfig = require("nvim-treesitter.configs")
      tsconfig.setup({
        ensure_installed = {
          "lua",
          "javascript",
          "c",
          "c_sharp",
          "cpp",
          "css",
          "go",
          "gomod",
          "gosum",
          "html",
          "jsdoc",
          "make",
          "proto",
          "csv",
          "commonlisp",
          "scheme",
          "sql",
          "toml",
          "typescript",
          "xml",
          "yaml",
        },
        ignore_install = {},
        modules = {},
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
