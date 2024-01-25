return {
    'cshuaimin/ssr.nvim',
    keys = {
        {'<leader>rR', '<cmd>lua require("ssr").open()<cr>', desc = 'Structural Replace'},
        {'<leader>rR', '<cmd>lua require("ssr").open()<cr>', mode = 'v', desc = 'Structural Replace'},
    },
    opts = {}
}

