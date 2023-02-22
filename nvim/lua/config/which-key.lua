local M = {}

function M.setup()
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
        vim.notify("Failed to load 'which-key' plugin", vim.log.levels.ERROR)
    end

    vim.o.timeout = true
    vim.o.timeoutlen = 300

    which_key.setup()
end

return M
