local M = {}

-- helper
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local opts = { noremap = true, silent = true }

-- TODO: only map keys for plugins if plugins are loaded

-- leader
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- navigation
map("n", "j", "gj")
map("n", "k", "gk")
map("v", "j", "gj")
map("v", "k", "gk")

-- indenting
map("v", ">", ">gv") -- don't lose selection when indenting
map("v", "<", "<gv") -- don't lose selection when indenting
map("v", "=", "=gv") -- don't lose selection when indenting

-- buffers
map("n", "L", "<CMD>BufferLineCycleNext<CR>", opts)
map("n", "H", "<CMD>BufferLineCyclePrev<CR>", opts)
map("n", ">b", "<CMD>BufferLineMoveNext<CR>", opts)
map("n", "<b", "<CMD>BufferLineMovePrev<CR>", opts)
map("n", "<leader>c", "<CMD>Bdelete<CR>", opts)
map("n", "<leader>w", "<CMD>w!<CR>", opts)
map("n", "<C-s>", "<CMD>w!<CR>", opts)
map("n", "<leader>qq", "<CMD>qa<CR>", opts)

-- windows
map("n", "<C-l>", "<C-w>l")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- nvim tree
map("n", "<leader>e", "<CMD>NvimTreeFocus<CR>", opts)
map("n", "<leader>E", "<CMD>NvimTreeClose<CR>", opts)

-- telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts)
map("n", "<leader>fF", "<CMD>Telescope find_files hidden=true no-ignore=true<CR>", opts)
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>", opts)
map("n", "<leader>fW", "<CMD>lua require('telescope.builtin').live_grep{ additional_args = function(args) return vim.list_extend(args, { '--hidden', '--no-ignore' }) end}<CR>", opts) -- TODO: find way to use :Telescope live_grep with these arguments

-- trouble
map("n", "<leader>xx", "<CMD>TroubleToggle<CR>", opts)
map("n", "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", opts)
map("n", "<leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", opts)
map("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>", opts)
map("n", "<leader>xq", "<CMD>TroubleToggle quickfix<CR>", opts)
map("n", "<leader>xr", "<CMD>TroubleToggle lsp_references<CR>", opts)

-- hop
map("n", "s", "<CMD>HopChar2<CR>", opts)

-- toggleterm
map("n", "<C-_>", "<CMD>lua require('config.toggleterm')._term_toggle()<CR>", opts)
map("t", "<C-_>", "<CMD>lua require('config.toggleterm')._term_toggle()<CR>", opts)
map("n", "<leader>tg", "<CMD>lua require('config.toggleterm')._lazygit_toggle()<CR>", opts)
map("n", "<leader>td", "<CMD>lua require('config.toggleterm')._lazydocker_toggle()<CR>", opts)

-- todo comments
map("n", "<leader>ft", "<CMD>TodoTelescope<CR>", opts)
map("n", "<leader>xt", "<CMD>TodoTrouble<CR>", opts)

-- lsp bindings
function M.on_attach(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    map("n", "gD", vim.lsp.buf.declaration, bufopts)
    map("n", "gd", vim.lsp.buf.definition, bufopts)
    map("n", "gi", vim.lsp.buf.implementation, bufopts) -- TODO: Can this have multiple implementors? Should use telescope if so
    map("n", "gr", vim.lsp.buf.references, bufopts) -- TODO: Should use telescope to show references
    map("n", "gT", vim.lsp.buf.type_definition, bufopts)
    map("n", "K", vim.lsp.buf.hover, bufopts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    map("n", "<C-.>", vim.lsp.buf.code_action, bufopts)
    map("n", "<leader>rr", vim.lsp.buf.rename, bufopts)
    map("n", "<leader>rf", function() vim.lsp.buf.format { async = true } end, bufopts)
end


return M
