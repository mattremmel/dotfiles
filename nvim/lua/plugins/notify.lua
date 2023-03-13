return {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
        vim.notify = require('notify') -- TODO: Does lazy.Util replace require?
    end
}
