-- tui
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.termguicolors = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.mouse = "a"
vim.opt.cursorline = false
vim.opt.background = "dark"
vim.opt.title = true
vim.opt.signcolumn = "yes"
vim.g.highlighturl_enabled = true -- requires plugin?
vim.g.icons_enabled = true -- requires NerdFont

-- gui
vim.o.guifont = "JetBrainsMono NFM Thin:h13"
vim.opt.linespace = 10
vim.g.neovide_padding_left = 15
vim.g.neovide_padding_right = 15

-- rendering
vim.opt.syntax = "off" -- use tree sitter instead
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = ""
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "
vim.opt.scrolloff = 8
vim.opt.fileencoding = "utf-8"

-- spaces / tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.copyindent = true
vim.opt.autoindent = true
vim.opt.preserveindent = true

-- whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" }
vim.opt.fillchars = { eob = " " }

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- folds
vim.opt.foldenable = false
vim.opt.foldmethod = "manual"
vim.opt.foldlevelstart = 99

-- auto completion / formatting / linting
vim.opt.spell = false -- disabled for too many false positives
-- vim.g.autoformat_enabled = true -- requires plugin
-- vim.g.cmp_enabled = true -- requires plugin
-- vim.g.autopairs_enabled = true -- requires plugin

-- terminal
vim.opt.hidden = true

-- performance
vim.opt.lazyredraw = false

-- session
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.confirm = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- diagnostics
vim.g.diagnostics_enabled = true
vim.g.status_diagnostics_enabled = true
vim.opt.visualbell = false

-- disable default plugins
vim.g.zipPlugin = false -- disable zip
vim.g.load_black = false -- disable black
vim.g.loaded_2html_plugin = true -- disable 2html
vim.g.loaded_getscript = true -- disable getscript
vim.g.loaded_getscriptPlugin = true -- disable getscript
vim.g.loaded_gzip = true -- disable gzip
vim.g.loaded_logipat = true -- disable logipat
vim.g.loaded_matchit = true -- disable matchit
vim.g.loaded_netrwFileHandlers = true -- disable netrw
vim.g.loaded_netrwPlugin = true -- disable netrw
vim.g.loaded_netrwSettngs = true -- disable netrw
vim.g.loaded_remote_plugins = true -- disable remote plugins
vim.g.loaded_tar = true -- disable tar
vim.g.loaded_tarPlugin = true -- disable tar
vim.g.loaded_zip = true -- disable zip
vim.g.loaded_zipPlugin = true -- disable zip
vim.g.loaded_vimball = true -- disable vimball
vim.g.loaded_vimballPlugin = true -- disable vimball

-- disable default providers
vim.g["loaded_node_provider"] = 0
vim.g["loaded_python3_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

---------------
-- autocommands
---------------
-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    command = "silent! lua vim.highlight.on_yank({ timeout = 500 })",
})

-- prevent accidental writes to buffers that shouldn't be edited
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.orig", command = "set readonly" })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*.pacnew", command = "set readonly" })
