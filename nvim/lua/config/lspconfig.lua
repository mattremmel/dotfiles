local M = {}

function M.setup()
    local status_ok, lspconfig = pcall(require, "lspconfig")
    if not status_ok then
        return
    end

    local on_attach = require("keymappings").on_attach
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
    lspconfig.sumneko_lua.setup {
        on_attach = on_attach,
        flags = lsp_flags,
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = {
                    globals = { "vim" }
                },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            }
        }
    }

    lspconfig.omnisharp.setup {
        -- TODO: find way to dynamically find dll
        cmd = { "dotnet", "/usr/lib/omnisharp-roslyn/OmniSharp.dll" },
        enable_editorconfig_support = true,
    }

end

return M
