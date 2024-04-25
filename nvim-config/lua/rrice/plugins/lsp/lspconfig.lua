return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      local masonlsp = require("mason-lspconfig")
      masonlsp.setup({
        ensure_installed = { "html", "gopls", "tsserver" },
        automatic_installation = true,
      })
      masonlsp.setup_handlers({
        function(server)
          require("lspconfig")[server].setup({})
        end,
      })
    end,
  },
}
