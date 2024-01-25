return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lua'
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        -- global

        -- NOTE: These are currently handled by noice
        -- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
        -- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

        local lspconfig = require('lspconfig')

        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }

            -- TODO: Set description for keymaps
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', bufopts)
            vim.keymap.set('n', 'gI', '<cmd>Telescope lsp_implmentations<cr>', bufopts)
            vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', bufopts)
            vim.keymap.set('n', 'gT', '<cmd>Telescope lsp_type_definitions<cr>', bufopts)
            vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_incoming_calls<cr>', bufopts)
            vim.keymap.set('n', 'go', '<cmd>Telescope lsp_outgoing_calls<cr>', bufopts)
            vim.keymap.set('n', 'gs', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)
            vim.keymap.set('n', 'gS', '<cmd>Telescope lsp_workspace_symbols<cr>', bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- TODO: Fix where pressing key again closes docs instead of entering them
            vim.keymap.set('n', '<leader>la', '<cmd>Lspsaga code_action<cr>', bufopts)
            vim.keymap.set('n', '<leader>lo', '<cmd>Lspsaga outline<cr>', bufopts)
            vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', bufopts)
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

