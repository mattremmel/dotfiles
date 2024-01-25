return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = { 'VeryLazy' },
    keys = {
        {"-", "<cmd>Oil<cr>", { desc = 'Open parent directory' }}
    },
    opts = {},
}
