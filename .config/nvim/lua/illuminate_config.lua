--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
})
