local M = {}

function M.setup()
  local status_ok, todo_comments = pcall(require, "todo-comments")
  if not status_ok then
    vim.notify("Failed to load 'todo-comments' plugin", vim.log.level.ERROR)
    return
  end

  todo_comments.setup()
end

return M
