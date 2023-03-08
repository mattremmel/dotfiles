return {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    cmd = {'TroubleToggle'},
    keys = {
        {'<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Toggle Trouble'},
        {'<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Toggle Trouble for workspace'},
        {'<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Toggle Trouble for document'},
        {'<leader>xl', '<cmd>TroubleToggle loclist<cr>', desc = 'Toggle Trouble for loclist'},
        {'<leader>xq', '<cmd>TroubleToggle quickfix<cr>', desc = 'Toggle Trouble for quickfix list'},
        {'<leader>xr', '<cmd>TroubleToggle lsp_references<cr>', desc = 'Toggle Trouble for LSP references'},
    },
    opts = {}
}
