local M = {}

function M.setup()
    local status_ok, nvim_tree = pcall(require, "nvim-tree")
    if not status_ok then
        vim.notify("Failed to load 'nvim-tree' plugin", vim.log.levels.ERROR)
        return
    end

    nvim_tree.setup {
        view = {
            adaptive_size = true
        }
    }
end

return M
