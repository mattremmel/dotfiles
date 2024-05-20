return {
    "stevearc/conform.nvim",
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
        },
    },
}
