return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "<leader>rf",
            function()
                require("conform").format({ lsp_fallback = true })
            end,
            mode = "n",
            desc = "Format Buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescriptreact = { "prettierd" },
            vue = { "prettierd" },
            css = { "prettierd" },
            scss = { "prettierd" },
            less = { "prettierd" },
            html = { "prettierd" },
            json = { "prettierd" },
            jsonc = { "prettierd" },
            yaml = { "prettierd" },
            markdown = { "prettierd" },
            ["markdown.mdx"] = { "prettierd" },
            graphql = { "prettierd" },
            handlebars = { "prettierd" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        }
    },
}
