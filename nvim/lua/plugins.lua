local M = {}

function M.setup()
  -- indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- check if packer.nvim is installed
  -- run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -----------------------------------------------
  -- Plugins ------------------------------------
  -----------------------------------------------
  local function plugins(use)

    use { "wbthomason/packer.nvim" }

    -- vim-notify
    use { "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    }

    -- colorscheme
    use {
      "EdenEast/nightfox.nvim",
      config = function()
        require("config.nightfox").setup()
      end,
    }

    -- startup screen
    use {
      "goolord/alpha-nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("config.alpha").setup()
      end,
    }

    -- status Bar
    use {
      "nvim-lualine/lualine.nvim",
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require("config.lualine").setup()
      end,
    }

    -- buffer line and tab page
    use {
      "akinsho/bufferline.nvim",
      branch = "main",
      event = "BufWinEnter",
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require("config.bufferline").setup()
      end
    }

    -- bufdelete
    use "famiu/bufdelete.nvim"

    -- nvim-autopairs
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("config.nvim-autopairs").setup()
        end
    }

    -- which-key
    use {
        "folke/which-key.nvim",
        config = function()
            require("config.which-key").setup()
        end
    }

    -- highlight special comments
    use {
      "folke/todo-comments.nvim",
      requires = {
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim", -- for integration
          "folke/trouble.nvim", -- for integration
      },
      config = function()
        require("config.todo-comments").setup()
      end
    }

    -- gitsigns
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns").setup()
        end
    }

    -- file explorer
    use {
      "nvim-tree/nvim-tree.lua",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("config.nvim-tree").setup()
      end
    }

    -- telescope
    use {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.0",
      requires = {
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope-fzf-native.nvim"
      },
      config = function()
        require("config.telescope").setup()
      end
    }

    -- telescope fzf native
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      requires = "nvim-telescope/telescope.nvim",
      run = "make",
    }

    -- trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("config.trouble").setup()
        end
    }

    -- hop
    use {
      'phaazon/hop.nvim',
      branch = 'v2',
      config = function()
        require("config.hop").setup()
      end
    }

    -- toggleterm
    use {
      "akinsho/toggleterm.nvim",
      tag = "*",
      config = function()
        require("config.toggleterm").setup()
      end
    }

    -- mason
    use {
      "williamboman/mason.nvim" ,
      config = function()
          require("config.mason").setup()
      end
    }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.treesitter").setup()
        end
    }

    -- indent-blankline
    use {
        "lukas-reineke/indent-blankline.nvim",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.indent-blankline").setup()
        end
    }

    -- hlargs
    use {
        "m-demare/hlargs.nvim",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.hlargs").setup()
        end
    }

    -- vim-illuminate
    use {
        "rrethy/vim-illuminate",
        config = function()
            require("config.vim-illuminate")
        end
    }

    -- lspconfig
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lspconfig").setup()
        end
    }

    -- mason-lspconfig
    use {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig"
        },
        config = function()
            require("config.mason-lspconfig").setup()
        end
    }

    -- nvim-navic
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
        config = function()
            require("config.nvim-navic").setup()
        end
    }

    -- nvim-cmp
    use {
        "hrsh7th/nvim-cmp",
        requires = {
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
    }

    -- friendly-snippets
    use {
        "rafamadriz/friendly-snippets",
        requires = "L3MON4D3/LuaSnip",
        config = function()
            require("config.friendly-snippets").setup()
        end
    }

    -- lspkind
    use {
        "onsails/lspkind.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
        },
        -- configured in nvim-cmp
    }

    -- TODO: dap, dap-ui, null-ls, lsp-saga, lsp_signature, nvim-lightbulb, comment.nvim, surround, impatient?, omnisharp-extended-lsp, schemastore,
    -- Lsp saga would replace navic breadcrumbs and nvim-lightbulb

    ----------------------------------------------------------
    ----------------------------------------------------------
    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
