return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
    },
    cmd = { 'Telescope' },
    -- TODO: Add keybinds here as well
    opts = {
        defaults = {
            prompt_prefix = " ",
            selection_caret = "❯ ",
            path_display = { "truncate" },
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },

            mappings = {
                i = {
                    ["<C-n>"] = function(...) return require('telescope.actions').cycle_history_next(...) end,
                    ["<C-p>"] = function(...) return require('telescope.actions').cycle_history_prev(...) end,
                    ["<C-j>"] = function(...) return require('telescope.actions').move_selection_next(...) end,
                    ["<C-k>"] = function(...) return require('telescope.actions').move_selection_previous(...) end,
                    -- TODO: Open with trouble, and open selected with trouble bindings: https://github.com/LazyVim/LazyVim/blob/1f7be0bbad3012046a53edb649b3cdc085e7ed54/lua/lazyvim/plugins/editor.lua#L149
                },
                n = { ["q"] = function(...) require('telescope.actions').close(...) end },
            },
        }
    }
}
