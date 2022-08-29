return {
  -- bindings for normal mode
  n = {
    -- disable some default bindings
    ["<leader>d"] = false, -- disable dashboard binding.
    ["<leader>gg"] = false, -- disable alternate mapping for LazyGit
    ["<leader>li"] = false, -- disable LSP info mapping. Use command :LspInfo
    ["<leader>lI"] = false, -- disable LSP install mapping. Use command :LspInstall
    ["<leader>pc"] = false, -- disable Packer Compile mapping. Use command :PackerCompile
    ["<leader>pi"] = false, -- disable Packer Install mapping. Use command :PackerInstall
    ["<leader>ps"] = false, -- disable Packer Sync mapping. Use command :PackerSync
    ["<leader>pS"] = false, -- disable Packer Status mapping. Use command :PackerStatus
    ["<leader>pu"] = false, -- disable Packer Update mapping. Use command :PackerUpdate
    ["<leader>tl"] = false, -- disable binding for remapping of LazyGit.
    ["<leader>o"] = false, --disable binding for NeoTree focus.

    -- file explorer
    ["<leader>e"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" }, -- overrides default mapping
    ["<leader>E"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },

    -- telescope file browser
    ["<leader>fb"] = { "<cmd>Telescope file_browser<cr>", desc = "File Browser" }, -- overrides default mapping
    ["<leader>fB"] = { function() require("telescope.builtin").buffers() end, desc = "Search buffers" }, -- remapped from <leader>fb

    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate up" },

    -- annotate bindings
    ["<leader>a<cr>"] = { function() require("neogen").generate() end, desc = "Current" },
    ["<leader>ac"] = { function() require("neogen").generate { type = "class" } end, desc = "Class" },
    ["<leader>af"] = { function() require("neogen").generate { type = "func" } end, desc = "Function" },
    ["<leader>at"] = { function() require("neogen").generate { type = "type" } end, desc = "Type" },
    ["<leader>aF"] = { function() require("neogen").generate { type = "file" } end, desc = "File" },

    -- ToggleTerm LazyGit
    ["<leader>tg"] = { function() astronvim.toggle_term_cmd "lazygit" end, desc = "LazyGit" },
    ["<leader>td"] = { function() astronvim.toggle_term_cmd "lazydocker" end, desc = "LazyDocker" },

    -- easy splits
    -- NOTE: Currently throwing errors
    -- ["\\"] = { "<cmd>split<cr>", desc = "Horizontal split" },
    -- ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },
  },

  -- bindings for insert mode
  i = {
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
  },

  -- bindings for visual mode
  v = {
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate up" },
  },

  -- bindings for terminal mode
  t = {
    -- disable default bindings that break LazyGit
    ["<esc>"] = false,
    ["jk"] = false,
  },
}
