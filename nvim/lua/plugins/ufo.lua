return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter", -- Optional, for better folding support
    },
    keys = {
        { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
        { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
        { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Open folds except certain kinds" },
        { "zm", function() require("ufo").closeFoldsWith() end, desc = "Close folds" },
    },
    config = function ()
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end
        })
    end
}
