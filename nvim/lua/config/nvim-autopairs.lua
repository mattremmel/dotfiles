local M = {}

function M.setup()
    local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
    if not status_ok then
        vim.notify("Failed to load 'nvim-autopairs' plugin", vim.log.levels.ERROR)
        return
    end

    nvim_autopairs.setup()
end

return M
