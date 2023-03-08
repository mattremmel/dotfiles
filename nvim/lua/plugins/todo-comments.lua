return {
    'folke/todo-comments.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    event = 'VeryLazy', -- TODO: This might not allow searching for todos from dashboard
    opts = {}
}
