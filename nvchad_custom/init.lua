vim.cmd [[colorscheme nordfox]]

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.showbreak = "↪ "
vim.opt.numberwidth = 2
vim.opt.smarttab = true
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.smartcase = true
vim.opt.guifont = { "JetBrainsMono Nerd Font:h8" }
vim.opt.list = true
vim.opt.listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" }
vim.opt.foldcolumn = "2"
vim.opt.foldlevel = 0
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.laststatus = 2
vim.opt.fillchars = [[eob: ,vert: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

vim.g.airline_powerline_fonts = 1
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_transparency = 0.5
vim.g.neovide_no_idle = true
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_vfx_particle_density = 10.0
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_confirm_quit = true
