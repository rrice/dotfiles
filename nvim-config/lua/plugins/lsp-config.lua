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

        ["rust_analyzer"] = function()
          require("rust-tools").setup()
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("cmp_nvim_lsp").default_capabilities()
      --local lspconfig = require("lspconfig")
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
