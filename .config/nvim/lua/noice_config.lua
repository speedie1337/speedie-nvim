--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

require('noice').setup({
    routes = {
        {
            filter = { event = "notify", find = "warning: multiple different client offset_encodings" },
            opts = { skip = true },
        },
    },
})
