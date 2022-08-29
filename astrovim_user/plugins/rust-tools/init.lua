return {
  after = "mason-lspconfig.nvim",
  config = function() require("rust-tools").setup(require "user.plugins.rust-tools.config") end,
}
