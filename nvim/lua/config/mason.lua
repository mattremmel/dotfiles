local M = {}

function M.setup()
    local status_ok, mason = pcall(require, "mason")
    if not status_ok then
        vim.notify("Failed to load 'mason' plugin")
        return
    end

    mason.setup()
end

return M
