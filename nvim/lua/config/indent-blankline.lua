local M = {}

function M.setup()
    local status_ok, indent_blankline = pcall(require, "indent_blankline")
    if not status_ok then
        vim.notify("Failed to load 'indent_blankline' plugin", vim.log.levels.ERROR)
        return
    end

    indent_blankline.setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    }
end

return M
