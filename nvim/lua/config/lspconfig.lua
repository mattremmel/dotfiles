local M = {}

function M.setup()
    local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_ok then
        vim.notify("Failed to load 'lspconfig' plugin", vim.log.levels.ERROR)
        return
    end

    local keymappings_ok, keymappings = pcall(require, "keymappings")
    if not keymappings_ok then
        vim.notify("Failed to load 'keymappings'", vim.log.levels.ERROR)
        return
    end

    local nvim_navic_ok, nvim_navic = pcall(require, "nvim-navic")
    if not nvim_navic_ok then
        vim.notify("Failed to load 'nvim-navic' plugin", vim.log.levels.ERROR)
        return
    end

    local on_attach = function(client, buffer)
        keymappings.attach(client, buffer)

        if client.server_capabilities.documentSymbolProvider then
            nvim_navic.attach(client, buffer)
        end
    end
    local lsp_flags = {}

    -- global
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    -- TODO: Maybe move this to a diagnostics file, along with DAP, and other general settings
    vim.fn.sign_define(
      "DiagnosticSignError",
      { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
    )
    vim.fn.sign_define(
      "DiagnosticSignWarn",
      { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" }
    )
    vim.fn.sign_define(
      "DiagnosticSignHint",
      { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" }
    )
    vim.fn.sign_define(
      "DiagnosticSignInfo",
      { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" }
    )

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

return M
