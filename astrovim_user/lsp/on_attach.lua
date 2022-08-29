return function(client, bufnr)
  -- Add global format on write hook.
  -- Added this because null-ls wasn't triggering the built in formatter that comes with some LSP implementations.
  -- Not sure how this will behave if null-ls and the active LSP both have a formatter.
  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
end
