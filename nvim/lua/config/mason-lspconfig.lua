local M = {}

function M.setup()
    local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not status_ok then
        vim.notify("Failed to load 'mason-lspconfig' plugin", vim.log.levels.ERROR)
        return
    end

    mason_lspconfig.setup()
end

return M
