return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local on_attach = function(client, bufnr)
            local function opts(desc)
                return { buffer = bufnr, desc = desc }
            end

            local map = vim.keymap.set

            map("n", "gD", vim.lsp.buf.declaration, opts("Find Declaration"))
            map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts("Find Definition"))
            -- BUG: This is being overwritten by built in `jump to last insert and highlight`
            map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts("Find Implementation"))
            map("n", "gr", "<cmd>Telescope lsp_references<cr>", opts("Find Reference"))
            map("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", opts("Find Type Definition"))
            map("n", "gI", "<cmd>Telescope lsp_incoming_calls<cr>", opts("Find Incoming Call"))
            map("n", "gO", "<cmd>Telescope lsp_outgoing_calls<cr>", opts("Find Outgoing Call"))
            map("n", "gs", "<cmd>Telescope lsp_document_symbols<cr>", opts("Find Document Symbol"))
            map("n", "gS", "<cmd>Telescope lsp_workspace_symbols<cr>", opts("Find Workspace Symbol"))
            map("n", "K", vim.lsp.buf.hover, opts("Show Hover"))

            map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts("Code Action"))
            map("n", "<leader>ls", vim.lsp.buf.signature_help, opts("Show Signature Help"))
            map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts("Add Workspace Folder"))
            map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts("Remove Workspace Folder"))
            map("n", "<leader>lwl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts("List Workspace Folders"))

            map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))

            -- setup signature popup
            if client.server_capabilities.signatureHelpProvider then
                vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                    border = "single",
                })

                vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                    border = "single",
                    focusable = false,
                    relative = "cursor",
                    silent = true,
                })

                local check_triggeredChars = function(triggerChars)
                    local cur_line = vim.api.nvim_get_current_line()
                    local pos = vim.api.nvim_win_get_cursor(0)[2]

                    cur_line = cur_line:gsub("%s+$", "") -- rm trailing spaces

                    for _, char in ipairs(triggerChars) do
                        if cur_line:sub(pos, pos) == char then
                            return true
                        end
                    end
                end

                local group = vim.api.nvim_create_augroup("LspSignature", { clear = false })
                vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

                local triggerChars = client.server_capabilities.signatureHelpProvider.triggerCharacters

                vim.api.nvim_create_autocmd("TextChangedI", {
                    group = group,
                    buffer = bufnr,
                    callback = function()
                        if check_triggeredChars(triggerChars) then
                            vim.lsp.buf.signature_help()
                        end
                    end,
                })
            end
        end
        --    end

        local on_init = function(client, _)
            if client.supports_method("textDocument/semanticTokens") then
                client.server_capabilities.semanticTokensProvider = nil
            end
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()

        local lspconfig = require("lspconfig")
        local servers_with_default_config = { "cssls", "html" }

        -- lsps with default config
        for _, lsp in ipairs(servers_with_default_config) do
            lspconfig[lsp].setup({
                on_attach = on_attach,
                on_init = on_init,
                capabilities = capabilities,
            })
        end

        lspconfig.lua_ls.setup({
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
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                            [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                },
            },
        })

        lspconfig.omnisharp.setup({
            on_attach = on_attach,
            on_init = on_init,
            capabilities = capabilities,
            cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
            settings = {
                ["omnisharp"] = {
                    enableRoslynAnalyzers = true,
                    organizeImportsOnFormat = true,
                    useModernNet = true,
                    RoslynExtensionsOptions = {
                        EnableEditorConfigSupport = true,
                    },
                },
            },
        })

        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            on_init = on_init,
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    check = {
                        command = "clippy",
                    },
                },
            },
        })
    end,
}
