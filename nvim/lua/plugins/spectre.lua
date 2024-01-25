return {
    "windwp/nvim-spectre",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>fr", function() require("spectre").open() end, desc = "Find and Replace" },
    },
    opts = {}
}

