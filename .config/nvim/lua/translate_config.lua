--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

require('translate').setup({
    default = {
        output = "insert",
    },
    preset = {
        output = {
            split = {
                append = true,
            },
        },
    },
})
