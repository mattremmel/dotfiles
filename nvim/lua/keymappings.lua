-- navigation
vim.keymap.set("n", "j", "v:count ? 'j' : 'gj'", {noremap = true, expr = true})
vim.keymap.set("n", "k", "v:count ? 'k' : 'gk'", {noremap = true, expr = true})
vim.keymap.set("v", "j", "v:count ? 'j' : 'gj'", {noremap = true, expr = true})
vim.keymap.set("v", "k", "v:count ? 'k' : 'gk'", {noremap = true, expr = true})

-- indenting
vim.keymap.set("v", ">", ">gv") -- don't lose selection when indenting
vim.keymap.set("v", "<", "<gv") -- don't lose selection when indenting
vim.keymap.set("v", "=", "=gv") -- don't lose selection when indenting

-- buffers
vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>", {noremap = true, silent = true, desc = 'Write Buffer'})
vim.keymap.set("n", "<C-s>", "<cmd>w!<cr>", {noremap = true, silent = true, desc = 'Write Buffer'})
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", {noremap = true, silent = true, desc = 'Quit Neovim'})

-- windows
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Search Highlights
vim.keymap.set("n", "<leader>h", "<cmd>noh<cr>", {noremap = true, silent = true, desc = 'Clear Search Highlights'})

-- Inserting Characters
vim.keymap.set("n", "<leader>;", "A;<esc>", {noremap = true, silent = true, desc = 'Insert Semicolon at Line End'})
vim.keymap.set("n", "<leader>,", "A,<esc>", {noremap = true, silent = true, desc = 'Insert Comma at Line End'})
