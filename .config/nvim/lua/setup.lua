--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

--[[
    This will include lua from the ~/.config/nvim/lua/ directory.
    If you want plugins to have special settings, you should modify those
    Lua files.
--]]
require('conform_config')
require('autoclose_config')
require('lsp_config')
require('lualine_config')
require('ibl_config')
require('bufferline_config')
require('tree_config')
require('ts_config')
require('theme_config')
require('trouble_config')
require('translate_config')
require('accelerated_config')
require('git_config')
require('colorizer_config')
require('illuminate_config')
require('aerial_config')
require('bigfile_config')
require('session_manager')
