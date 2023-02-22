local M = {}

function M.setup()
    local status_ok, hop = pcall(require, "hop")
    if not status_ok then
        vim.notify("Failed to load 'hop' plugin", vim.log.levels.ERROR)
        return
    end

    hop.setup()
end

return M
