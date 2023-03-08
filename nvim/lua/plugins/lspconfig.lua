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
            require('keymappings').attach(client, buffer) -- TODO: Make where keymappings are consistent with rest of project
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
