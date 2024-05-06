local map = vim.keymap.set

-- In order to set custom bindings, we need to reimplement
-- on attach function. It also means we need to reconfigure
-- lua lsp below.
local on_attach = function(client, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts "Go to Declaration")
    map("n", "gd", vim.lsp.buf.definition, opts "Go to Definition")
    map("n", "K", vim.lsp.buf.hover, opts "Hover Information")
    map("n", "gi", vim.lsp.buf.implementation, opts "Go to Implementation")
    map("n", "<leader>ls", vim.lsp.buf.signature_help, opts "Show Signature Help")
    map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts "Add Workspace Folder")
    map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts "Remove Workspace Folder")

    map("n", "<leader>lwl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts "List Workspace Folders")

    map("n", "gt", vim.lsp.buf.type_definition, opts "Go to Type Definition")

    map("n", "<leader>rn", function()
        require "nvchad.lsp.renamer" ()
    end, opts "Rename")

    map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts "Code Action")
    map("n", "gr", vim.lsp.buf.references, opts "Show References")

    -- setup signature popup
    if client.server_capabilities.signatureHelpProvider then
        require("nvchad.lsp.signature").setup(client, bufnr)
    end
end
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = on_init,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = 'clippy'
            },
        }
    }
}
