return {
    'folke/todo-comments.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    cmd = {'TodoTelescope', 'TodoTrouble'},
    keys = {
        {'<leader>ft', '<cmd>TodoTelescope<cr>', desc = "Find TODO Comments"},
        {'<leader>xt', '<cmd>TodoTrouble<cr>', desc = "Toggle Trouble for TODO Comments"},
    },
    opts = {}
}
