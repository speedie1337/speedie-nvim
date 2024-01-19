--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

-- Requires vim 0.9 or later
if vim.fn.has('nvim-0.9') == 1 or vim.fn.has('nvim-1') == 1 then
    require('neogit').setup({})
end
