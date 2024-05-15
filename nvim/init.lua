vim.g.mapleader = " "

-- SECTION: INITIALIZE LAZY
---------------------------
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

-- SECTION: KEY MAPPINGS
-----------------------

local map = vim.keymap.set

-- modes
map("n", ";", ":", { desc = "CMD enter command mode" })

-- clear highlights
map("n", "<Esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })

-- navigation
map("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
map("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
map("v", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
map("v", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- indenting
map("v", ">", ">gv") -- don't lose selection when indenting
map("v", "<", "<gv") -- don't lose selection when indenting
map("v", "=", "=gv") -- don't lose selection when indenting

-- buffers
map("n", "<leader>w", "<cmd>w!<cr>", { noremap = true, silent = true, desc = "Write Buffer" })
map("n", "<leader>qq", "<cmd>qa<cr>", { noremap = true, silent = true, desc = "Quit Neovim" })

-- inserting characters
map("n", "<leader>;", "A;<esc>", { noremap = true, silent = true, desc = "Insert Semicolon at Line End" })
map("n", "<leader>,", "A,<esc>", { noremap = true, silent = true, desc = "Insert Comma at Line End" })

-- SECTION: PLUGINS
-------------------

require("lazy").setup({

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            fast_wrap = {},
            disable_filetypes = { "TelescopePrompt", "vim" },
        },
    },

    -- buffer delete
    {
        "famiu/bufdelete.nvim",
        keys = {
            { "<leader>c", "<cmd>Bdelete<cr>", desc = "Close Current Buffer" },
        },
        config = function() end,
    },

    -- buffer line
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "BufWinEnter",
        keys = {
            { "L", "<cmd>BufferLineCycleNext<cr>", desc = "Cycle to Next Buffer" },
            { "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Cycle to Previous Buffer" },
            { ">b", "<cmd>BufferLineMoveNext<cr>", desc = "Re-order Current Buffer to Next Position" },
            { "<b", "<cmd>BufferLineCyclePrev<cr>", desc = "Re-order Current Buffer To Previous Position" },
        },
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "PanelHeading",
                    },
                },
            },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            {
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)
                end,
            },
        },
        config = function()
            local function border(hl_name)
                return {
                    { "╭", hl_name },
                    { "─", hl_name },
                    { "╮", hl_name },
                    { "│", hl_name },
                    { "╯", hl_name },
                    { "─", hl_name },
                    { "╰", hl_name },
                    { "│", hl_name },
                }
            end

            local cmp = require("cmp")
            local lspkind = require("lspkind")
            cmp.setup({
                completion = {
                    completeopt = "menu,menuone",
                },

                window = {
                    completion = {
                        side_padding = 1,
                        scrollbar = false,
                    },
                    documentation = {
                        border = border("CmpDocBorder"),
                        winhighlight = "Normal:CmpDoc",
                    },
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    format = lspkind.cmp_format(),
                },

                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),

                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif require("luasnip").expand_or_jumpable() then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                                ""
                            )
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif require("luasnip").jumpable(-1) then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                                ""
                            )
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
                },
            })
        end,
    },

    -- colorschemes
    {
        {
            "catppuccin/nvim",
            name = "catppuccin",
            lazy = true,
        },

        {
            "EdenEast/nightfox.nvim",
            lazy = true,
            opts = {
                palettes = {
                    nordfox = {
                        bg0 = "#141414",
                        bg1 = "#222222",
                    },
                },
            },
        },

        {
            "Mofiqul/vscode.nvim",
            lazy = true,
        },
    },

    -- comment
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n", desc = "Comment Toggle Current Line" },
            { "gc", mode = { "n", "o" }, desc = "Comment Toggle Linewise" },
            { "gc", mode = "x", desc = "Comment Toggle Linewise (Visual)" },
            { "gbc", mode = "n", desc = "Comment Toggle Current Block" },
            { "gb", mode = { "n", "o" }, desc = "Comment Toggle Blockwise" },
            { "gb", mode = "x", desc = "Comment Toggle Blockwise (Visual)" },
        },
        opts = {},
    },

    -- conform formatting
    {
        "stevearc/conform.nvim",
        keys = {
            {
                "<leader>rf",
                function()
                    require("conform").format({ lsp_fallback = true })
                end,
                mode = "n",
                desc = "Format Buffer",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
            },
        },
    },

    -- debug adapter
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },

        -- stylua: ignore
        keys = {
            { '<leader>dt', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
            { '<leader>db', function() require('dap').set_breakpoint() end, desc = 'Set Breakpoint' },
            { '<leader>dr', function() require('dap').repl.open() end, desc = 'Open REPL' },
            { '<leader>dl', function() require('dap').run_last() end, desc = 'Run Last' },
            { '<leader>dn', function() require('dap').continue() end, desc = 'Continue' },
            { '<leader>do', function() require('dap').step_over() end, desc = 'Step Over' },
            { '<leader>di', function() require('dap').step_into() end, desc = 'Step Into' },
            { '<leader>dO', function() require('dap').step_out() end, desc = 'Step Out' },
            { '<leader>dh', mode = { 'n', 'v' }, function() require('dap.ui.widgets').hover() end, desc = 'Hover UI' },
            { '<leader>dp', mode = { 'n', 'v' }, function() require('dap.ui.widgets').preview() end, desc = 'Preview' },
            { '<leader>df',
                function()
                    local widgets = require('dap.ui.widgets')
                    widgets.centered_float(widgets.frames)
                end, desc = 'Show Frames'
            },
            { '<leader>ds',
                function()
                    local widgets = require('dap.ui.widgets')
                    widgets.centered_float(widgets.scopes)
                end, desc = 'Show Scopes'
            },
        },
        config = function()
            vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },

    -- git signs
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "Gitsigns" },
        keys = {
            { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Blame" },
            { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Open Diff" },
            { "<leader>gD", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle Deleted" },
            {
                "<leader>gn",
                function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        require("gitsigns").next_hunk()
                    end)
                    return "<Ignore>"
                end,
                expr = true,
                desc = "Next Hunk",
            },
            {
                "<leader>gp",
                function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        require("gitsigns").prev_hunk()
                    end)
                    return "<Ignore>"
                end,
                expr = true,
                desc = "Previous Hunk",
            },
            { "ih", ":<C-U>Gitsigns select_hunk<cr>", mode = { "o", "x" }, desc = "Select Hunk" },
        },
        opts = {},
    },

    -- hop
    {
        "phaazon/hop.nvim",
        version = "v2",
        keys = {
            { "s", "<cmd>HopChar2<cr>", desc = "Start Hop Movement" },
        },
        opts = {},
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        opts = {
            options = {
                component_separators = "|",
                section_separators = { left = "", right = "" },
            },
        },
    },

    -- mason package manager
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        opts = {
            ensure_installed = {
                -- LSP's
                "css-lsp",
                "html-lsp",
                "lua-language-server",
                "rust-analyzer",

                -- Formatters
                "prettier",
                "stylua",
            },
            automatic_installation = true,
        },
        config = function(_, opts)
            require("mason").setup(opts)
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                if opts.ensure_installed and #opts.ensure_installed > 0 then
                    vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
                end
            end, {})
        end,
    },

    -- nvim tree file browser
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        cmd = { "NvimTreeFocus", "NvimTreeClose", "NvimTreeToggle", "NvimTreeFindFile" },
        keys = {
            { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "Open/Focus NvimTree" },
            { "<leader>E", "<cmd>NvimTreeClose<cr>", desc = "Close NvimTree" },
        },
        opts = {
            view = {
                adaptive_size = true,
            },
        },
    },

    -- nvim lsp config
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            local on_attach = function(client, bufnr)
                local function opts(desc)
                    return { buffer = bufnr, desc = desc }
                end

                map("n", "gD", vim.lsp.buf.declaration, opts("Find Declaration"))
                map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts("Find Definition"))
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
            local servers = { "html", "cssls" }

            -- lsps with default config
            for _, lsp in ipairs(servers) do
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
    },

    -- oil file manager
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        events = { "VeryLazy" },
        keys = {
            { "-", "<cmd>Oil<cr>", { desc = "Open Oil File Manager" } },
        },
        opts = {},
    },

    -- telescope
    {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            lazy = true,
            build = "make",
            config = function() end,
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-fzf-native.nvim",
            },
            cmd = { "Telescope" },
            -- stylua: ignore
            keys = {
                { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
                { "<leader>fF", "<cmd>Telescope find_files hidden=true no-ignore=true<cr>", desc = "Find Files (+hidden)", },
                { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find Word" },
                { "<leader>fW", "<cmd>lua require('telescope.builtin').live_grep{ additional_args = function(args) return vim.list_extend(args, { '--hidden', '--no-ignore' }) end}<cr>", desc = "Find Word (+hidden)", },
                { "<leader>fB", "<cmd>Telescope buffers<cr>", desc = "Find Open Buffers" },
                { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find Text in Current Buffer" },
                { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
                { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help Tags" },
                { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Plugin/User Commands" },
                { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Find Items in Quickfix List" },
                { "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Find Items in Location List" },
                { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Find Entries in Jump List" },
                { "<leader>fg", "<cmd>Telescope git_commits<cr>", desc = "Find Git Commits" },
                { "<leader>fn", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", desc = "Find notifications", },
                { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Find Marks" },
                { "<leader>fgc", "<cmd>Telescope git_commits<cr>", desc = "Find Git Commits" },
                { "<leader>fgs", "<cmd>Telescope git_status<cr>", desc = "Find Git Status" },
            },
            opts = {
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = "❯ ",
                    path_display = { "truncate" },
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },

                    mappings = {
                        i = {
                            ["<C-n>"] = function(...)
                                return require("telescope.actions").cycle_history_next(...)
                            end,
                            ["<C-p>"] = function(...)
                                return require("telescope.actions").cycle_history_prev(...)
                            end,
                            ["<C-j>"] = function(...)
                                return require("telescope.actions").move_selection_next(...)
                            end,
                            ["<C-k>"] = function(...)
                                return require("telescope.actions").move_selection_previous(...)
                            end,
                            -- TODO: Open with trouble, and open selected with trouble bindings: https://github.com/LazyVim/LazyVim/blob/1f7be0bbad3012046a53edb649b3cdc085e7ed54/lua/lazyvim/plugins/editor.lua#L149
                        },
                        n = {
                            ["q"] = function(...)
                                require("telescope.actions").close(...)
                            end,
                        },
                    },
                },
            },
        },
    },

    {
        "akinsho/toggleterm.nvim",
        keys = {
            { "<C-p>", "<cmd>lua Toggleterm_default_toggle()<cr>", desc = "Toggle terminal" },
            { "<C-p>", "<cmd>lua Toggleterm_default_toggle()<cr>", mode = "t", desc = "Toggle terminal" },
            { "<leader>tg", "<cmd>lua Toggleterm_lazygit_toggle()<cr>", desc = "Toggle lazygit" },
            { "<leader>td", "<cmd>lua Toggleterm_lazydocker_toggle()<cr>", desc = "Toggle lazydocker" },
        },
        config = function()
            require("toggleterm").setup({
                size = 10,
                open_mapping = [[<F7>]],
                shading_factor = 2,
                direction = "float",
                float_opts = {
                    border = "curved",
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            })

            local Terminal = require("toggleterm.terminal").Terminal

            -- default
            local default = Terminal:new({ hidden = true })

            function Toggleterm_default_toggle()
                default:toggle()
            end

            -- lazygit
            local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

            function Toggleterm_lazygit_toggle()
                lazygit:toggle()
            end

            -- lazydocker
            local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })

            function Toggleterm_lazydocker_toggle()
                lazydocker:toggle()
            end
        end,
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "TSUpdate", "TSModuleInfo" },
        opts = {
            ensure_installed = {
                "asm",
                "bash",
                "c",
                "c_sharp",
                "capnp",
                "cmake",
                "cpp",
                "css",
                "diff",
                "disassembly",
                "dockerfile",
                "dot",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "git_config",
                "git_rebase",
                "go",
                "graphql",
                "haskell",
                "hcl",
                "html",
                "http",
                "ini",
                "java",
                "javascript",
                "json",
                "json5",
                "jq",
                "just",
                "kotlin",
                "latex",
                "linkerscript",
                "llvm",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "nasm",
                "ninja",
                "nix",
                "objc",
                "objdump",
                "perl",
                "php",
                "proto",
                "python",
                "regex",
                "ron",
                "ruby",
                "rust",
                "scala",
                "scss",
                "sql",
                "ssh_config",
                "svelte",
                "swift",
                "terraform",
                "tmux",
                "toml",
                "tsx",
                "typescript",
                "typst",
                "vim",
                "vimdoc",
                "vue",
                "xml",
                "yaml",
                "zig",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            rainbow = {
                enable = true,
                disable = { "html" },
                extended_mode = false,
                max_file_lines = nil,
            },
            autotag = { enable = true },
            incremental_selection = { enable = true },
            indent = { enable = false },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- trouble
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        cmd = { "TroubleToggle" },
        -- stylua: ignore
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
            { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Trouble for Workspace" },
            { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Toggle Trouble for Document" },
            { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Toggle Trouble for Location List" },
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle Trouble for Quickfix List" },
            { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Toggle Trouble for LSP References", },
        },
        opts = {},
    },

    -- todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        event = { "BufEnter", "BufNewFile" },
        cmd = { "TodoTelescope", "TodoTrouble" },
        keys = {
            { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODO Comments" },
            {
                "<leader>xt",
                "<cmd>TodoTrouble<cr>",
                desc = "Toggle Trouble for TODO Comments",
            },
            {
                "]t",
                function()
                    require("todo-comments").jump_next()
                end,
                desc = "Next TODO Comment",
            },
            {
                "[t",
                function()
                    require("todo-comments").jump_prev()
                end,
                desc = "Previous TODO Comment",
            },
        },
        opts = {},
    },

    {
        "rrethy/vim-illuminate",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("illuminate").configure({
                -- options
            })
        end,
    },

    -- vim tmux navigator
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
    },

    {
        "folke/which-key.nvim",
        lazy = false,
        opts = {
            window = {
                border = "single",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 2, 2, 2, 2 },
                winblend = 0,
            },
        },
        config = function(_, opts)
            vim.o.timeout = true
            vim.o.timeoutlen = 300

            local which_key = require("which-key")
            which_key.setup(opts)
            which_key.register({
                f = { name = "Find" },
                g = { name = "Git" },
                l = { name = "LSP" },
                q = { name = "Quit" },
                r = { name = "Refactor" },
                t = { name = "Terminal" },
                x = { name = "Trouble" },
            }, { prefix = "<leader>" })
        end,
    },
})

-- SECTION: DIAGNOSTICS
-----------------------

vim.fn.sign_define(
    "DiagnosticSignError",
    { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" })

-- SECTION: VIM OPTIONS
-----------------------

-- tui
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.termguicolors = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.mouse = "a"
vim.opt.cursorline = false
vim.opt.background = "dark"
vim.opt.title = true
vim.opt.signcolumn = "yes"
vim.g.highlighturl_enabled = true -- requires plugin?
vim.g.icons_enabled = true -- requires NerdFont

-- rendering
vim.opt.syntax = "off" -- use tree sitter instead
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = ""
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "
vim.opt.scrolloff = 8
vim.opt.fileencoding = "utf-8"

-- spaces / tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.copyindent = true
vim.opt.autoindent = true
vim.opt.preserveindent = true

-- whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" }
vim.opt.fillchars = { eob = " " }

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- auto completion / formatting / linting
vim.opt.spell = false -- disabled for too many false positives
-- vim.g.autoformat_enabled = true -- requires plugin
-- vim.g.cmp_enabled = true -- requires plugin
-- vim.g.autopairs_enabled = true -- requires plugin

-- terminal
vim.opt.hidden = true

-- performance
vim.opt.lazyredraw = false

-- session
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.confirm = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- diagnostics
vim.g.diagnostics_enabled = true
vim.g.status_diagnostics_enabled = true
vim.opt.visualbell = false

-- disable default plugins
vim.g.zipPlugin = false -- disable zip
vim.g.load_black = false -- disable black
vim.g.loaded_2html_plugin = true -- disable 2html
vim.g.loaded_getscript = true -- disable getscript
vim.g.loaded_getscriptPlugin = true -- disable getscript
vim.g.loaded_gzip = true -- disable gzip
vim.g.loaded_logipat = true -- disable logipat
vim.g.loaded_matchit = true -- disable matchit
vim.g.loaded_netrwFileHandlers = true -- disable netrw
vim.g.loaded_netrwPlugin = true -- disable netrw
vim.g.loaded_netrwSettngs = true -- disable netrw
vim.g.loaded_remote_plugins = true -- disable remote plugins
vim.g.loaded_tar = true -- disable tar
vim.g.loaded_tarPlugin = true -- disable tar
vim.g.loaded_zip = true -- disable zip
vim.g.loaded_zipPlugin = true -- disable zip
vim.g.loaded_vimball = true -- disable vimball
vim.g.loaded_vimballPlugin = true -- disable vimball

-- disable default providers
vim.g["loaded_node_provider"] = 0
vim.g["loaded_python3_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

-- colorscheme
vim.cmd("colorscheme nordfox")

-- add mason install to path
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
