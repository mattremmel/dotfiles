return {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy', -- TODO: This should load on keybind
    config = function()
        require('toggleterm').setup {
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

        local Terminal = require('toggleterm.terminal').Terminal

        -- default
        local default = Terminal:new({ hidden = true })

        function toggleterm_default_toggle()
            default:toggle()
        end

        -- lazygit
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

        function toggleterm_lazygit_toggle()
            lazygit:toggle()
        end

        -- lazydocker
        local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })

        function toggleterm_lazydocker_toggle()
            lazydocker:toggle()
        end
    end
}
