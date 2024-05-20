return {
    "akinsho/toggleterm.nvim",
    keys = {
        { "<C-p>", "<cmd>lua Toggleterm_default_toggle()<cr>", desc = "Toggle terminal" },
        { "<C-p>", "<cmd>lua Toggleterm_default_toggle()<cr>", mode = "t", desc = "Toggle terminal" },
        { "<leader>tg", "<cmd>lua Toggleterm_lazygit_toggle()<cr>", desc = "Toggle lazygit" },
        { "<leader>td", "<cmd>lua Toggleterm_lazydocker_toggle()<cr>", desc = "Toggle lazydocker" },
    },
    config = function()
        require("toggleterm").setup({
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
        })

        local Terminal = require("toggleterm.terminal").Terminal

        -- default
        local default = Terminal:new({ hidden = true })

        function Toggleterm_default_toggle()
            default:toggle()
        end

        -- lazygit
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

        function Toggleterm_lazygit_toggle()
            lazygit:toggle()
        end

        -- lazydocker
        local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })

        function Toggleterm_lazydocker_toggle()
            lazydocker:toggle()
        end
    end,
}
