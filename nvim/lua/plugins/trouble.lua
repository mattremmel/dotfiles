return {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = { "TroubleToggle" },
    -- stylua: ignore
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
        { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Trouble for Workspace" },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Toggle Trouble for Document" },
        { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Toggle Trouble for Location List" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle Trouble for Quickfix List" },
        { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Toggle Trouble for LSP References", },
    },
    opts = {},
}
