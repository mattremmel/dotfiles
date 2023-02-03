local M = {}

function M.setup()
  local status_ok, bufferline = pcall(require, "bufferline")
  if not status_ok then
    return
  end

  -- TODO: Explicity set full config
  bufferline.setup {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "PanelHeading",
        }
      }
    }
  }
end

return M
