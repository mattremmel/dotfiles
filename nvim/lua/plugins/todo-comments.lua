return {
    'folke/todo-comments.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    event = { 'BufEnter', 'BufNewFile' },
    cmd = {'TodoTelescope', 'TodoTrouble'},
    keys = {
        {'<leader>ft', '<cmd>TodoTelescope<cr>', desc = "Find TODO Comments"},
        {'<leader>xt', '<cmd>TodoTrouble<cr>', desc = "Toggle Trouble for TODO Comments"},
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO Comment" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous TODO Comment" },
    },
    opts = {}
}
