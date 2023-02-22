local M = {}

function M.setup()
    local status_ok, hlargs = pcall(require, "hlargs")
    if not status_ok then
        vim.notify("Failed to load 'hlargs' plugin", vim.log.levels.ERROR)
        return
    end

    -- TODO: Add support for c_sharp
    hlargs.setup()
end

return M
