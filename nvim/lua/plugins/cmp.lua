return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind.nvim',
        {
            "L3MON4D3/LuaSnip",
            dependencies = "rafamadriz/friendly-snippets",
            opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            config = function(_, opts)
              require("luasnip").config.set_config(opts)
            end,
        },
    },
    opts = {
    },
    config = function(_, opts)
        local cmp = require('cmp')
        cmp.setup {
          mapping = {
              ['<Tab>'] = cmp.mapping(function(fallback)
                  fallback()
              end, { 'i', 's'}),
          }
        }

        -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    end
}

