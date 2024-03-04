--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

local bufferline = require("bufferline")
bufferline.setup({
    options = {
        style_preset = bufferline.style_preset.no_italic,
        diagnostics = "nvim_lsp",

        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
    },
})
