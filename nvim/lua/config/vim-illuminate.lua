local M = {}

function M.setup()
    local status_ok, vim_illuminate = pcall(require, "vim-illuminate")
    if not status_ok then
        vim.notify("Failed to load 'vim-illuminate' plugin", vim.log.levels.ERROR)
        return
    end

    -- can overwrite default values if needed
    -- vim_illuminate.configure {}
end


return M
