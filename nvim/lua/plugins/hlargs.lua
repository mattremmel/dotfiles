return {
    'm-demare/hlargs.nvim',
    enabled = false,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {}
}
