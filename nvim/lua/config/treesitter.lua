local M = {}

function M.setup()
    local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        return
    end

    treesitter.setup {
        -- TODO: config is from astronvim
        auto_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          context_commentstring = {
            enable = true,
            enable_autocmd = false,
          },
          rainbow = {
            enable = true,
            disable = { "html" },
            extended_mode = false,
            max_file_lines = nil,
          },
          autotag = { enable = true },
          incremental_selection = { enable = true },
          indent = { enable = false },
    }
end

return M
