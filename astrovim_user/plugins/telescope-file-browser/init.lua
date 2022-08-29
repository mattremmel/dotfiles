return {
  after = "telescope.nvim",
  module = "telescope._extensions.file_browser",
  config = function() require "user.plugins.telescope-file-browser.config" end,
}
