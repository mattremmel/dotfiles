local opts = { noremap = true, silent = true }

-- navigation
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- indenting
vim.keymap.set("v", ">", ">gv") -- don't lose selection when indenting
vim.keymap.set("v", "<", "<gv") -- don't lose selection when indenting
vim.keymap.set("v", "=", "=gv") -- don't lose selection when indenting

-- buffers
vim.keymap.set("n", "<leader>w", "<CMD>w!<CR>", opts)
vim.keymap.set("n", "<C-s>", "<CMD>w!<CR>", opts)
vim.keymap.set("n", "<leader>qq", "<CMD>qa<CR>", opts)

-- windows
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
