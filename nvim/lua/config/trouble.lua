local M = {}

function M.setup()
    local status_ok, trouble = pcall(require, "trouble")
    if not status_ok then
        vim.notify("Failed to load 'trouble' plugin", vim.log.levels.ERROR)
        return
    end

    trouble.setup()
end

return M
