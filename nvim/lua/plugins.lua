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
      requires = "nvim-lua/plenary.nvim",
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

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter").setup()
        end
    }

    -- lspconfig
    use {
        "neovim/nvim-lspconfig",
        run = ":TSUpdate",
        config = function()
            require("config.lspconfig").setup()
        end
    }

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("config.luasnip")
        end
    }


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
