require("nightfox").setup {
  options = {
    dim_inactive = true,
    styles = { comments = "italic" },
    modules = {
      barbar = false,
      dashboard = false,
      fern = false,
      fidget = false,
      gitgutter = false,
      glyph_palette = false,
      hop = false,
      illuminate = false,
      lightspeed = true,
      lsp_saga = false,
      lsp_trouble = false,
      modes = false,
      neogit = false,
      nvimtree = false,
      pounce = false,
      sneak = false,
      symbols_outline = false,
    },
  },
  -- specs = {
  --   all = {
  --     telescope = {
  --       bg_alt = "bg2",
  --       bg = "bg1",
  --       fg = "fg1",
  --       green = "green",
  --       red = "red",
  --     },
  --   },
  -- },
  groups = {
    all = {
      HighlightURL = { style = "underline" },
      MiniIndentscopeSymbol = { link = "PreProc" },
      NormalFloat = { link = "Normal" },
    },
  },
}
