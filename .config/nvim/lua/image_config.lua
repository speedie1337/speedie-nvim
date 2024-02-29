--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--
if EnableImageSupport == true then
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

    local imageBackend = "kitty"

    if ImageBackend == "ueberzug" then
        imageBackend = "ueberzug"
    else
        imageBackend = "kitty"
    end

    require('image').setup({
        integrations = {
            markdown = {
                resolve_image_path = function(document_path, image_path, fallback)
                    return fallback(document_path, image_path)
                end,
            }
        },
        backend = imageBackend,
    })
end
