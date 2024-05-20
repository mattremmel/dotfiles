vim.g.mapleader = " "

-- lazy initilization
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- configuration modules
require('options')
require('keymappings')
require('diagnostics')
require("lazy").setup('plugins')

-- colorscheme
vim.cmd('colorscheme nordfox')

