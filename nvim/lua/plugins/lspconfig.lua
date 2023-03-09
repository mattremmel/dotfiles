return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        -- global
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

        local lspconfig = require('lspconfig')

        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) -- TODO: Can this have multiple implementors? Should use telescope if so
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- TODO: Should use telescope to show references
            vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>rf', function() vim.lsp.buf.format { async = true } end, bufopts)
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local lsp_flags = {}

        local opts = {}
        for _, server in pairs(require('lsp.servers')) do
            opts = {
                on_attach = on_attach,
                capabilities = capabilities,
                flags = lsp_flags,
            }

            server = vim.split(server, '@')[1]

            local require_ok, lsp_settings = pcall(require, 'lsp.settings.' .. server)
            if require_ok then
                opts = vim.tbl_deep_extend('force', lsp_settings, opts) -- TODO: If the lsp_settings wanted to override flags, would this work
            end

            lspconfig[server].setup(opts)
        end
    end
}
