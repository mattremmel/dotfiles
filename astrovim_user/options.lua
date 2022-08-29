return {
  opt = {
    -- neovide font
    -- guifont = { "FiraCode Nerd Font", ":h9" },
    guifont = { "JetBrainsMono Nerd Font", ":h8" },

    -- soft wrap
    linebreak = true,
    wrap = true,
    showbreak = "↪ ",

    -- show characters
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },

    -- dictionary / thesaurus
    -- spellfile = "~/.config/nvim/lua/user/spell/en.utf-8.add",
    -- thesaurus = "~/.config/nvim/lua/user/spell/mthesaur.txt",
  },
}
