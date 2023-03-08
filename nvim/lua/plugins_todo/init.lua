return {
   -- vim-notify
   {
       "rcarriga/nvim-notify",
       config = function()
           vim.notify = require("notify")
       end,
   },

   -- colorscheme
   {
     "EdenEast/nightfox.nvim",
     config = function()
       require("config.nightfox").setup()
     end,
   },

   -- startup screen
   {
     "goolord/alpha-nvim",
     dependencies = { "nvim-tree/nvim-web-devicons" },
     config = function()
       require("config.alpha").setup()
     end,
   },

   -- buffer line and tab page
   {
     "akinsho/bufferline.nvim",
     branch = "main",
     event = "BufWinEnter",
     dependencies = 'nvim-tree/nvim-web-devicons',
     config = function()
       require("config.bufferline").setup()
     end
   },

   -- bufdelete
   { "famiu/bufdelete.nvim" },

   -- nvim-autopairs
   {
       "windwp/nvim-autopairs",
       config = function()
           require("config.nvim-autopairs").setup()
       end
   },

   -- which-key
   {
       "folke/which-key.nvim",
       config = function()
           require("config.which-key").setup()
       end
   },

   -- highlight special comments
   {
     "folke/todo-comments.nvim",
     dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope.nvim", -- for integration
         "folke/trouble.nvim", -- for integration
     },
     config = function()
       require("config.todo-comments").setup()
     end
   },

   -- gitsigns
   {
       "lewis6991/gitsigns.nvim",
       config = function()
           require("config.gitsigns").setup()
       end
   },

   -- file explorer
   {
     "nvim-tree/nvim-tree.lua",
     dependencies = "nvim-tree/nvim-web-devicons",
     config = function()
       require("config.nvim-tree").setup()
     end
   },

   -- telescope
   {
     "nvim-telescope/telescope.nvim",
     tag = "0.1.0",
     dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope-fzf-native.nvim"
     },
     config = function()
       require("config.telescope").setup()
     end
   },

   -- telescope fzf native
   {
     "nvim-telescope/telescope-fzf-native.nvim",
     dependencies = "nvim-telescope/telescope.nvim",
     build = "make",
   },

   -- trouble
   {
       "folke/trouble.nvim",
       dependencies = "nvim-tree/nvim-web-devicons",
       config = function()
         require("config.trouble").setup()
       end
   },

   -- hop
   {
     'phaazon/hop.nvim',
     branch = 'v2',
     config = function()
       require("config.hop").setup()
     end
   },

   -- toggleterm
   {
     "akinsho/toggleterm.nvim",
     tag = "*",
     config = function()
       require("config.toggleterm").setup()
     end
   },

   -- mason
   {
     "williamboman/mason.nvim" ,
     config = function()
         require("config.mason").setup()
     end
   },

   -- treesitter
   {
       "nvim-treesitter/nvim-treesitter",
       build = ":TSUpdate",
       config = function()
           require("config.treesitter").setup()
       end
   },

   -- indent-blankline
   {
       "lukas-reineke/indent-blankline.nvim",
       dependencies = "nvim-treesitter/nvim-treesitter",
       config = function()
           require("config.indent-blankline").setup()
       end
   },

   -- hlargs
   {
       "m-demare/hlargs.nvim",
       dependencies = "nvim-treesitter/nvim-treesitter",
       config = function()
           require("config.hlargs").setup()
       end
   },

   -- vim-illuminate
   {
       "rrethy/vim-illuminate",
       config = function()
           require("config.vim-illuminate")
       end
   },

   -- lspconfig
   {
       "neovim/nvim-lspconfig",
       config = function()
           require("config.lspconfig").setup()
       end
   },

   -- mason-lspconfig
   {
       "williamboman/mason-lspconfig.nvim",
       dependencies = {
           "williamboman/mason.nvim",
           "neovim/nvim-lspconfig"
       },
       config = function()
           require("config.mason-lspconfig").setup()
       end
   },

   -- nvim-cmp
   {
       "hrsh7th/nvim-cmp",
       dependencies = {
           "hrsh7th/cmp-nvim-lsp",
           "hrsh7th/cmp-buffer",
           "hrsh7th/cmp-path",
           "hrsh7th/cmp-cmdline",
           "hrsh7th/cmp-nvim-lua",
           "saadparwaiz1/cmp_luasnip",
           "L3MON4D3/LuaSnip",
       },
       config = function()
           require("config.nvim-cmp").setup()
       end
   },

   -- friendly-snippets
   {
       "rafamadriz/friendly-snippets",
       dependencies = "L3MON4D3/LuaSnip",
       config = function()
           require("config.friendly-snippets").setup()
       end
   },

   -- lspkind
   {
       "onsails/lspkind.nvim",
       dependencies = {
           "neovim/nvim-lspconfig",
           "hrsh7th/nvim-cmp",
       },
       -- configured in nvim-cmp
   },

   -- TODO: dap, dap-ui, null-ls, lsp-saga, lsp_signature, nvim-lightbulb, comment.nvim, surround, impatient?, omnisharp-extended-lsp, schemastore,
   -- Lsp saga would replace navic breadcrumbs and nvim-lightbulb, treesitter-text-objects
}