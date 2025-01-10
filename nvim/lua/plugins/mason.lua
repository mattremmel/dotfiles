return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    opts = {
        ensure_installed = {
            -- LSP's
            "css-lsp",
            "html-lsp",
            "lua-language-server",
            "omnisharp",
            "basedpyright",
            "rust-analyzer",
            "tailwindcss-language-server",
            "typescript-language-server",

            -- Linters
            "eslint-lsp",
            "ruff",

            -- Formatters
            "black",
            "isort",
            "prettierd",
            "stylua",

            -- Debuggers
            "codelldb",
        },
        automatic_installation = true,
    },
    config = function(_, opts)
        require("mason").setup(opts)
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            if opts.ensure_installed and #opts.ensure_installed > 0 then
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end
        end, {})
    end,
}
