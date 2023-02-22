local M = {}

function M.setup()
    local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        vim.notify("Failed to load 'nvim-treesitter.configs' plugin", vim.log.levels.ERROR)
        return
    end

    treesitter.setup {
        ensure_installed = {
            "help",
            "lua",
            "bash",
            "c",
            "c_sharp",
            "cmake",
            "cpp",
            "dockerfile",
            "dot",
            "gitignore",
            "go",
            "graphql",
            "haskell",
            "hcl",
            "html",
            "http",
            "java",
            "javascript",
            "json",
            "json5",
            "kotlin",
            "latex",
            "make",
            "markdown",
            "markdown_inline",
            "python",
            "regex",
            "ron",
            "ruby",
            "rust",
            "scss",
            "sql",
            "swift",
            "terraform",
            "toml",
            "typescript",
        },
        auto_install = true,
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
