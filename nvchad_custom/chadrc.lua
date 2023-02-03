local M = {}

M.plugins = require("custom.plugins")


M.ui = {
  theme = "onenord",
}

M.mappings = require("custom.mappings")

vim.cmd [[colorscheme nordfox]]

return M
