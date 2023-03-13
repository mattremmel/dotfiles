return {
    "windwp/nvim-spectre",
    keys = {
        { "<leader>fr", function() require("spectre").open() end, desc = "Find and Replace" },
    },
}

