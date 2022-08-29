require("neogen").setup {
  snippet_engine = "luasnip",
  languages = {
    cs = { template = { annotation_convention = "xmldoc" } }, -- TODO: This config doesn't seem to be getting picked up
    lua = { template = { annotation_convention = "ldoc" } },
    python = { template = { annotation_convention = "google_docstrings" } },
    typescript = { template = { annotation_convention = "tsdoc" } },
    typescriptreact = { template = { annotation_convention = "tsdoc" } },
  },
}
