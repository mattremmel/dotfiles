return {
  "folke/noice.nvim",
  -- NOTE: Conflicts with other plugins
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
      -- TODO: Additional configuration to take advantage of treesitter
  },
}
