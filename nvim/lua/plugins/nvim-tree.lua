return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    cmd = {'NvimTreeFocus', 'NvimTreeClose', 'NvimTreeToggle', 'NvimTreeFindFile'},
    opts = {
        view = {
            adaptive_size = true
        }
    }
}
