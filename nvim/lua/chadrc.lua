-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "vscode_dark",

	telescope = {
	    style = "bordered"
	},

	hl_override = {
        TelescopePromptTitle = {
            fg = "white",
            bg = "black",
        },
        TelescopePreviewTitle = {
            fg = "white",
            bg = "black",
        },
        TelescopeResultsTitle = {
            fg = "white",
            bg = "black",
        },
        TroublePreview = {
            fg = 'black',
        }
	}
}

M.base46 = {
    integrations = {
        'cmp',
        'git',
        'trouble',
        'todo',
    }
}

return M
