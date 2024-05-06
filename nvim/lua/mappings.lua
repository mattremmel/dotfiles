-- disable nvchad default mappings
-- require "nvchad.mappings"

-- Disable mappings
local unmap = vim.keymap.del;
-- unmap({ 'n', 'v'}, '<Space>ca')

local map = vim.keymap.set

-- modes 
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- clear highlights
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })

-- navigation
map("n", "j", "v:count ? 'j' : 'gj'", {noremap = true, expr = true})
map("n", "k", "v:count ? 'k' : 'gk'", {noremap = true, expr = true})
map("v", "j", "v:count ? 'j' : 'gj'", {noremap = true, expr = true})
map("v", "k", "v:count ? 'k' : 'gk'", {noremap = true, expr = true})
map('n', '<C-h>', '<cmd>TmuxNavigateLeft<cr>')
map('n', '<C-j>', '<cmd>TmuxNavigateDown<cr>')
map('n', '<C-k>', '<cmd>TmuxNavigateUp<cr>')
map('n', '<C-l>', '<cmd>TmuxNavigateRight<cr>')

-- indenting
map("v", ">", ">gv") -- don't lose selection when indenting
map("v", "<", "<gv") -- don't lose selection when indenting
map("v", "=", "=gv") -- don't lose selection when indenting

-- buffers
map("n", "<leader>w", "<cmd>w!<cr>", {noremap = true, silent = true, desc = 'Write Buffer'})
map("n", "<leader>qq", "<cmd>qa<cr>", {noremap = true, silent = true, desc = 'Quit Neovim'})

-- inserting characters
map("n", "<leader>;", "A;<esc>", {noremap = true, silent = true, desc = 'Insert Semicolon at Line End'})
map("n", "<leader>,", "A,<esc>", {noremap = true, silent = true, desc = 'Insert Comma at Line End'})

-- commenting
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Line" })

map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Block" }
)

-- buffers
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New Buffer" })

map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "Next Buffer" })

map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "Previous Buffer" })

map("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close Buffer" })

-- format
map("n", "<leader>rf", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format File" })

-- general lsp
map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "Floating Diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Add Diagnostic to Location List" })

-- nvim tree
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Show/Focus NvimTree" })
map("n", "<leader>E", "<cmd>NvimTreeClose<CR>", { desc = "Close NvimTree" })

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map(
  "n",
  "<leader>fF",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Find Files (+hidden)" }
)
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fW", "", { desc = "Live Grep (+hidden)"})
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Search Help Page" })
map("n", "<leader>ma", "<cmd>Telescope marks<cr>", { desc = "Find Marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Find Oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Live Grep (buffer)" })
map("n", "<leader>fgc", "<cmd>Telescope git_commits<cr>", { desc = "Find Git Commits" })
map("n", "<leader>fgs", "<cmd>Telescope git_status<cr>", { desc = "Find Git Status" })
map("n", "<leader>pt", "<cmd>Telescope terms<cr>", { desc = "Pick Hidden Term" })
map("n", "<leader>fh", "<cmd>Telescope themes<cr>", { desc = "Find Theme" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find Keymaps" })
map("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Search Quickfix List" })
map("n", "<leader>fl", "<cmd>Telescope loclist<cr>", { desc = "Search Location List" })
map("n", "<leader>fj", "<cmd>Telescope jumplist", { desc = "Search Jump List" })

-- trouble
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = 'Toggle Trouble' })
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { desc = 'Toggle Trouble for Workspace' })
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { desc = 'Toggle Trouble for Document' })
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { desc = 'Toggle Trouble for Location List' })
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { desc = 'Toggle Trouble for Quickfix List' })
map('n', '<leader>xr', '<cmd>TroubleToggle lsp_references<cr>', { desc = 'Toggle Trouble for LSP References' })
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = 'Toggle Trouble' })
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = 'Toggle Trouble' })
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = 'Toggle Trouble' })

-- todo
map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'Find TODOs' })
map('n', '<leader>xt', '<cmd>TodoTrouble<cr>', { desc = 'Toggle Trouble for TODOs' })
map('n', ']t', function () require('todo-comments').jump_next() end, { desc = 'Next TODO Comment' })
map('n', '[t', function () require('todo-comments').jump_prev() end, { desc = 'Previous TODO Comment' })

-- oil
map('n', '-', '<cmd>Oil<cr>', { desc = 'Open Oil File Manager' })

-- cheatsheet
map('n','<leader>fm', '<cmd>NvCheatsheet<cr>', { desc = 'Show Mapping Cheatsheet' })

-- toggleable term
map({ "n", "t" }, "<leader>tv", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Toggle Vertical Terminal" })

map({ "n", "t" }, "<leader>th", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Toggle Horizontal Terminal" })

map({ "n", "t" }, "<leader>tt", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle Floating Terminal" })

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Close Terminal" })

-- terminal windows
map("n", "<leader>tnh", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "New Horizontal Terminal Window" })

map("n", "<leader>tnv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "New Vertical Terminal Window" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <cr>", { desc = "Show All Whichkey Mappings" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "Whichkey Query Lookup" })
