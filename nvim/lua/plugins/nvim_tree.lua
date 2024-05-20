return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeFocus", "NvimTreeClose", "NvimTreeToggle", "NvimTreeFindFile" },
    keys = {
        { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Open/Focus NvimTree" },
        { "<leader>E", "<cmd>NvimTreeClose<cr>", desc = "Close NvimTree" },
    },
    opts = {
        view = {
            adaptive_size = true,
        },
    },
}
