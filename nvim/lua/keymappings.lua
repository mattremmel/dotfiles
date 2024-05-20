local map = vim.keymap.set

-- modes
map("n", ";", ":", { desc = "CMD enter command mode" })

-- clear highlights
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })

-- navigation
map("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
map("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
map("v", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
map("v", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })

-- TODO: Move these keymappings to plugin config
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- indenting
map("v", ">", ">gv") -- don't lose selection when indenting
map("v", "<", "<gv") -- don't lose selection when indenting
map("v", "=", "=gv") -- don't lose selection when indenting

-- buffers
map("n", "<leader>w", "<cmd>w!<cr>", { noremap = true, silent = true, desc = "Write Buffer" })
map("n", "<leader>qq", "<cmd>qa<cr>", { noremap = true, silent = true, desc = "Quit Neovim" })

-- inserting characters
map("n", "<leader>;", "A;<esc>", { noremap = true, silent = true, desc = "Insert Semicolon at Line End" })
map("n", "<leader>,", "A,<esc>", { noremap = true, silent = true, desc = "Insert Comma at Line End" })
