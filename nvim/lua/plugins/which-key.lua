return {
    'folke/which-key.nvim',
    lazy = false,
    opts = {
        window = {
             border = "single",
            position = "bottom",
            margin = { 1, 0, 1, 0 },
            padding = { 2, 2, 2, 2 },
            winblend = 0,
        }
    },
    config = function(_, opts)
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local which_key = require('which-key')
        which_key.setup(opts)
        which_key.register({
            f = { name = 'Find' },
            q = { name = 'Quit' },
            r = { name = 'Refactor' },
            t = { name = 'Terminal' },
            x = { name = 'Trouble' },
        },
        { prefix = '<leader>' })
    end
}
