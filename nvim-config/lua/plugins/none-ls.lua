return {
  "nvimtools/none-ls.nvim",
  enabled = false, -- Disabled because of conform.nvim.
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint_d,
      },
    })
  end,
}
