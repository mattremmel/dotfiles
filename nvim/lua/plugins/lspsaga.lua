return {
   "glepnir/lspsaga.nvim",
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      {"nvim-treesitter/nvim-treesitter"} --Please make sure you install markdown and markdown_inline parser
    },
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = {'Lspsaga'},
    opts = {},
}
