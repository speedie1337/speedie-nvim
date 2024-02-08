--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    view = {
        width = 30,
    },
    filters = {
        dotfiles = true,
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
})
