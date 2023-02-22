local M = {}

function M.setup()
    local status_ok, gitsigns = pcall(require, "gitsigns")
    if not status_ok then
        vim.notify("Failed to load 'gitsigns' plugin")
        return
    end

    -- TODO: Set up keybindings
    gitsigns.setup()
end

return M
