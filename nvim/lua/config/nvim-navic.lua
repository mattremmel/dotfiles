local M = {}

function M.setup()
    local status_ok, nvim_navic = pcall(require, "nvim-navic")
    if not status_ok then
        vim.notify("Failed to load 'nvim-navic' plugin", vim.log.levels.ERROR)
        return
    end

    nvim_navic.setup()
end

return M
