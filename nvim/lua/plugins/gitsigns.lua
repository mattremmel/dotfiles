return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'Gitsigns' },
    keys = {
        {'<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', desc = 'Toggle Git Blame'}
    },
    opts = {}
}
