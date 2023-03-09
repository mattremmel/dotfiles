return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
    },
    cmd = { 'Telescope' },
    keys = {
        {'<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files'},
        {'<leader>fF', '<cmd>Telescope find_files hidden=true no-ignore=true<cr>', desc = 'Find Files (+hidden)'},
        {'<leader>fw', '<cmd>Telescope live_grep<cr>', desc = 'Find Word'},
        {'<leader>fW', "<cmd>lua require('telescope.builtin').live_grep{ additional_args = function(args) return vim.list_extend(args, { '--hidden', '--no-ignore' }) end}<cr>", desc = 'Find Word (+hidden)'},
        {'<leader>fB', '<cmd>Telescope buffers<cr>', desc = 'Find Open Buffers'},
        {'<leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Find Text in Current Buffer'},
        {'<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find Keymaps'},
        {'<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find Help Tags'},
        {'<leader>fc', '<cmd>Telescope commands<cr>', desc = 'Find Plugin/User Commands'},
        {'<leader>fq', '<cmd>Telescope quickfix<cr>', desc = 'Find Items in Quickfix List'},
        {'<leader>fl', '<cmd>Telescope loclist<cr>', desc = 'Find Items in Location List'},
        {'<leader>fj', '<cmd>Telescope jumplist<cr>', desc = 'Find Entries in Jump List'},
        {'<leader>fg', '<cmd>Telescope git_commits<cr>', desc = 'Find Entries in Jump List'},
    },
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
