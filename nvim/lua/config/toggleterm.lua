local M = {}

function M.setup()
    local status_ok, toggleterm = pcall(require, "toggleterm")
    if not status_ok then
        return
    end

    toggleterm.setup {
        size = 10,
        open_mapping = [[<F7>]],
        shading_factor = 2,
        direction = "float",
        float_opts = {
            border = "curved",
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    }

    local Terminal = require("toggleterm.terminal").Terminal

    -- default
    local default = Terminal:new({ hidden = true })

    function M._term_toggle()
        default:toggle()
    end
    
    -- lazygit
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function M._lazygit_toggle()
        lazygit:toggle()
    end

    -- lazydocker
    local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })

    function M._lazydocker_toggle()
        lazydocker:toggle()
    end
end

return M
