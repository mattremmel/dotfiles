return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'Gitsigns' },
    keys = {
        {'<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', desc = 'Toggle Git Blame'},
        {'<leader>gn', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() require('gitsigns').next_hunk() end)
            return '<Ignore>'
        end,
        expr = true,
        desc = 'Next Git Hunk'},
        {'<leader>gp', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() require('gitsigns').prev_hunk() end)
            return '<Ignore>'
        end,
        expr = true,
        desc = 'Previous Git Hunk'},
    },
    opts = {}
}
