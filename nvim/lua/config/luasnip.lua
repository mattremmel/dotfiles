local M = {}

function M.setup()
  local status_ok, luasnip = pcall(require, "luasnip")
  if not status_ok then
    return
  end


end

return M
