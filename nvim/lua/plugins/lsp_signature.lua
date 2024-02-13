return {
    'ray-x/lsp_signature.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        doc_lines = 10,
        hint_prefix = '@ ',
        toggle_key = '<C-i>'
    }
}

