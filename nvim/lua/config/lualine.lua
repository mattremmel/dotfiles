local M = {}

function M.setup()
    local lualine_ok, lualine = pcall(require, "lualine")
    if not lualine_ok then
        vim.notify("Failed to load 'lualine' plugin", vim.log.levels.ERROR)
        return
    end

    local nvim_navic_ok, nvim_navic = pcall(require, "nvim-navic")
    if not nvim_navic_ok then
        vim.notify("Failed to load 'nvim-navic' plugin", vim.log.levels.ERROR)
        return
    end

    lualine.setup {
        winbar = {
            lualine_c = {
                { nvim_navic.get_location, cond = nvim_navic.is_available },
            }
        }
    }
end

return M
