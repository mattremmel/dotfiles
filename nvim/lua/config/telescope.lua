local M = {}

function M.setup()
    local telescope_ok, telescope = pcall(require, "telescope")
    if not telescope_ok then
        vim.notify("Failed to load 'telescope' plugin")
        return
    end

    local actions_ok, actions = pcall(require, "telescope.actions")
    if not actions_ok then
        vim.notify("Failed to load 'telescope.actions'", vim.log.levels.ERROR)
        return
    end

    telescope.setup {
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
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
                n = { ["q"] = actions.close },
            },
        }
    }

    -- TODO: How to handle this if it fails, or fzf isn't installed
    telescope.load_extension("fzf")
end

return M
