return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = 'BufWinEnter',
    keys = {
        {'L', '<cmd>BufferLineCycleNext<cr>', desc = 'Cycle to next buffer'},
        {'H', '<cmd>BufferLineCyclePrev<cr>', desc = 'Cycle to previous buffer'},
        {'>b', '<cmd>BufferLineMoveNext<cr>', desc = 'Re-order current buffer to next position'},
        {'<b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Re-order current buffer to previous position'},
    },
    opts = {
        options = {
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    highlight = 'PanelHeading',
                }
            }
        }
    }
}
