return {
    'folke/todo-comments.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    cmd = {'TodoTelescope', 'TodoTrouble'},
    keys = {
        {'<leader>ft', '<cmd>TodoTelescope<cr>'},
        {'<leader>xt', '<cmd>TodoTrouble<cr>'},
    },
    opts = {}
}
