return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lspconfig = require('lspconfig')

        local on_attach = function(client, buffer)
            local bufopts = { noremap = true, silent = true, buffer = buffer }

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts) -- TODO: Can this have multiple implementors? Should use telescope if so
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts) -- TODO: Should use telescope to show references
            vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
            vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.format { async = true } end, bufopts)
        end

        local lsp_flags = {}

        -- global
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

        -- lua
        lspconfig.lua_ls.setup {
            on_attach = on_attach,
            flags = lsp_flags,
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = {
                        globals = { "vim" }
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false
                    },
                    telemetry = {
                        enable = false,
                    },
                }
            }
        }

        -- omnisharp
        lspconfig.omnisharp.setup {
            on_attach = on_attach,
            flags = lsp_flags,
        }

        -- TODO: rust, typescript, python, c_sharp, docker, hcl, yamls + schemas, marksman, bashls, clangd, cmake, cssls, eslint, graphql, html, java, kotlin, go, jsonls, ruby, sql, stylua, toml
    end
}
