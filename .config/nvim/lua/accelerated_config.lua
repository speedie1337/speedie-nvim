--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

require("accelerated-jk").setup({
    mode = 'time_driven',
    enable_deceleration = false,
    acceleration_motions = {},
    acceleration_limit = MaxAccelerationSpeed,
    acceleration_table = { 7,12,17,21,24,26,28,30 },
    -- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
    deceleration_table = { {MaxAccelerationSpeed, 9999} }
})
