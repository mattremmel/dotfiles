return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },

    {
        'nvim-tree/nvim-tree.lua',
        opts = {
            view = {
                adaptive_size = true
            }
        }
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            -- require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "prettier",
                "rust-analyzer",
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                'bash',
                'c',
                'c_sharp',
                'cmake',
                'cpp',
                'css',
                'diff',
                'dockerfile',
                'dot',
                'gitignore',
                'go',
                'graphql',
                'haskell',
                'hcl',
                'html',
                'http',
                'java',
                'javascript',
                'json',
                'json5',
                'kotlin',
                'latex',
                'lua',
                'make',
                'markdown',
                'markdown_inline',
                'python',
                'regex',
                'ron',
                'ruby',
                'rust',
                'scss',
                'sql',
                'swift',
                'terraform',
                'toml',
                'tsx',
                'typescript',
                'vim',
                'vimdoc',
                'xml',
                'yaml',
                'zig'
            },
        },
    },

    {
        "folke/trouble.nvim",
        dependencies = 'nvim-tree/nvim-web-devicons',
        cmd = { 'TroubleToggle' },
        config = function()
            dofile(vim.g.base46_cache .. 'trouble')
            require('trouble').setup()
        end
    },

    {
        "folke/todo-comments.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        event = { 'BufEnter', 'BufNewFile' },
        cmd = { 'TodoTelescope', 'TodoTrouble' },
        config = function()
            dofile(vim.g.base46_cache .. 'todo')
            require('todo-comments').setup()
        end
    },

    {
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        events = { 'VeryLazy' },
        opts = {}
    },

    {
        'christoomey/vim-tmux-navigator',
        cmd = {
            'TmuxNavigateLeft',
            'TmuxNavigateDown',
            'TmuxNavigateUp',
            'TmuxNavigateRight',
            'TmuxNavigatePrevious'
        }
    }
}
