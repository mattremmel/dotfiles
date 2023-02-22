local M = {}

function M.setup()
    local status_ok, nightfox = pcall(require, "nightfox")
    if not status_ok then
        vim.notify("Failed to load 'nightfox' plugin", vim.log.levels.ERROR)
        return
    end

    nightfox.setup()
    vim.cmd("colorscheme nordfox") -- nightfox.setup must be call before loading
end

return M
