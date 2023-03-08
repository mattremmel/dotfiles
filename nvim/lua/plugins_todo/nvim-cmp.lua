local M = {}

function M.setup()
    local cmp_ok, cmp = pcall(require, "cmp")
    if not cmp_ok then
        vim.notify("Failed to load 'cmp' plugin", vim.log.levels.ERROR)
        return
    end

    local luasnip_ok, luasnip = pcall(require, "luasnip")
    if not luasnip_ok then
        vim.notify("Failed to load 'luasnip' plugin", vim.log.levels.ERROR)
        return
    end

    local lspkind_ok, lspkind = pcall(require, "lspkind")
    if not lspkind_ok then
        vim.notify("Failed to load 'lspkind' plugin", vim.log.levels.ERROR)
        return
    end

    cmp.setup {
        snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end
        },
        mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),
      formatting = {
          format = lspkind.cmp_format({
              mode = 'symbol_text',
              maxwidth = 50,
              ellipsis_char = '...',
          })
      }
    }

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

end

-- TODO: Figure out how to make this work with 'import'
function M.capabilities()
  local status_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  if not status_ok then
    return
  end

  return cmp_lsp.default_capabilities()
end

return M

