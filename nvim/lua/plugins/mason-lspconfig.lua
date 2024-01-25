return {
   'williamboman/mason-lspconfig.nvim',
   dependencies = {
       'williamboman/mason.nvim',
       'neovim/nvim-lspconfig'
   },
   cmd = {'LspInstall'},
   opts = {
       automatic_installation = true,
       ensure_installed = require('lsp.servers')
   }
}

