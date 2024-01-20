--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

vim.api.nvim_set_keymap('', LeaderKey, '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = LeaderKey
vim.g.maplocalleader = LeaderKey

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function combineTable(table1,table2)
    for i=1,#table2 do
        table1[#table1+1] = table2[i]
    end
    return table1
end

require("lazy").setup(combineTable(Plugins, Themes))
require("setup")
