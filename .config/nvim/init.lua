--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

require('bootstrap')

local cmd = vim.cmd
local opt = vim.opt
local o = vim.o
local keymap = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd
local sessionFile = vim.fn.expand('~/.config/nvim/.session.nvim')

require("lazy").setup({
    { 'nvim-telescope/telescope.nvim', dependencies = {
        'nvim-lua/plenary.nvim',
    } }, -- Fuzzy-finding
    { 'nvim-lualine/lualine.nvim' }, -- Status line
    { 'm4xshen/autoclose.nvim' }, -- Autoclose brackets
    { 'romgrk/doom-one.vim' }, -- Doom-One theme
    { 'stevearc/conform.nvim' }, -- Formatting
    { 'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        }, opts = {
            clickable = true,
            animation = true,
            focus_on_close = 'left',
        } }, -- Tabs
    { 'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
        } }, -- Server auto-install
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
    } }, -- LSP
})

opt.title = true -- Display title
opt.spelllang = 'en_us' -- Use English (United States) as spellcheck language by default
opt.relativenumber = true -- Show relative line numbers
opt.mouse = 'a' -- Enable mouse
opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.hidden = true -- Hides buffers
opt.smarttab = true -- Enable smart tab
opt.ignorecase = true -- Enable case insensitivity when searching
opt.smartcase = true -- Pretty much same for this one
opt.hlsearch = false -- Don't highlight searches
opt.smartindent = true -- Automatically indent the next line
opt.autoindent = true -- Pretty much same for this one
opt.expandtab = true -- Replace tabs with spaces automatically
opt.swapfile = false -- Don't use a swapfile
opt.cursorline = true -- Show the cursor line
opt.undolevels = 10000 -- Allow up to 10000 undos
opt.tabstop = 4 -- Display a tab (\t) as 4 spaces
opt.softtabstop = 4 -- Display a tab (\t) as 4 spaces
opt.shiftwidth = 4 -- Indents for << or >>
opt.spellsuggest = 'best,5' -- Prefer the best suggestions
opt.foldmethod = 'indent' -- Fold based on indents
opt.laststatus = 0 -- Don't display file information
opt.termguicolors = true -- Enable true color
opt.autochdir = true -- Automatically change directory to the file we're editing
opt.background = 'dark' -- Set background to dark

o.t_8f = '\27[38;2;%lu;%lu;%lum' -- To be honest, I don't know what this does but if I remember correctly it's something good.
o.t_8b = '\27[48;2;%lu;%lu;%lum' -- To be honest, I don't know what this does but if I remember correctly it's something good.

cmd([[
    colorscheme doom-one
    highlight Normal ctermfg=grey ctermbg=lightgray guifg=#ffffff guibg=#222222
    highlight EndOfBuffer ctermfg=grey ctermbg=lightgray guifg=#ffffff guibg=#222222
    highlight Folded ctermfg=grey ctermbg=lightgray guifg=#afeeee guibg=#333333
    highlight SpellBad guisp=red gui=undercurl guifg=none guibg=none ctermfg=none ctermbg=none term=underline cterm=undercurl
    highlight SpellCap guisp=yellow gui=undercurl guifg=none guibg=none ctermfg=none ctermbg=none term=underline cterm=undercurl
    filetype plugin indent on
]])

keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
keymap('n', '<C-s>', ':split<cr>', { noremap = true, silent = true })
keymap('n', '<C-w>', ':vsplit<cr>', { noremap = true, silent = true })
keymap('n', '<C-q>', ':only<cr>', { noremap = true, silent = true })
keymap('n', '<C-t>', ':term<cr>', { noremap = true, silent = true })
keymap('n', '<C-f>', ':Telescope fd<cr>', { noremap = true, silent = true })
keymap('n', '<F2>', ':set spell!<cr>', { noremap = true, silent = true })
keymap('n', '<F3>', ':set spelllang=en_us<cr>', { noremap = true, silent = true })
keymap('n', '<F4>', ':set spelllang=sv_se<cr>', { noremap = true, silent = true })
keymap('n', '<F7>', ':silent execute "!setxkbmap us"<cr>', { noremap = true, silent = true })
keymap('n', '<F8>', ':silent execute "!setxkbmap se"<cr>', { noremap = true, silent = true })
keymap('n', '<C-e>', 'z=', { noremap = true, silent = true })
keymap('n', '<C-b>', ':!ninja -C build<cr>', { noremap = true, silent = true })
keymap('n', 'H', ':vertical resize -10<cr>', { noremap = true, silent = true })
keymap('n', 'J', ':resize -10<cr>', { noremap = true, silent = true })
keymap('n', 'K', ':resize +10<cr>', { noremap = true, silent = true })
keymap('n', 'L', ':vertical resize +10<cr>', { noremap = true, silent = true })
keymap('n', 'd', '"_d', { noremap = true, silent = true })
keymap('x', 'd', '"_d', { noremap = true, silent = true })
keymap('x', 'p', '"_dP', { noremap = true, silent = true })
keymap('n', 'c', '"_c', { noremap = true, silent = true })
keymap('n', '<C-A>', 'v/{<cr>%', { noremap = true, silent = true })
keymap('n', '<A-,>', '<Cmd>BufferPrevious<cr>', { noremap = true, silent = true })
keymap('n', '<A-.>', '<Cmd>BufferNext<cr>', { noremap = true, silent = true })
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<cr>', { noremap = true, silent = true })
keymap('n', '<A->>', '<Cmd>BufferMoveNext<cr>', { noremap = true, silent = true })
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<cr>', { noremap = true, silent = true })
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<cr>', { noremap = true, silent = true })
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<cr>', { noremap = true, silent = true })
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<cr>', { noremap = true, silent = true })
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<cr>', { noremap = true, silent = true })
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<cr>', { noremap = true, silent = true })
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<cr>', { noremap = true, silent = true })
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<cr>', { noremap = true, silent = true })
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<cr>', { noremap = true, silent = true })
keymap('n', '<A-0>', '<Cmd>BufferLast<cr>', { noremap = true, silent = true })
keymap('n', '<A-p>', '<Cmd>BufferPin<cr>', { noremap = true, silent = true })
keymap('n', '<A-c>', '<Cmd>BufferClose<cr>', { noremap = true, silent = true })
keymap('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<cr>', { noremap = true, silent = true })
keymap('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<cr>', { noremap = true, silent = true })
keymap('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<cr>', { noremap = true, silent = true })
keymap('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<cr>', { noremap = true, silent = true })


local function saveSession() -- Save the current session
    vim.cmd('mksession! ' .. sessionFile)
end

local function restoreSession() -- Restore the last session
    if vim.fn.argc() == 0 then
        if vim.fn.filereadable(sessionFile) == 1 then
            vim.cmd('source ' .. sessionFile)
            vim.cmd("filetype detect")
        end
    end
end

autocmd('BufWritePre', { -- Remove trailing spaces
    pattern = { '*' },
    callback = function()
        vim.cmd("%s/\\s\\+$//e")
    end,
})
autocmd('BufReadPre', { -- Enable spell check for all Markdown files
    pattern = { '*.md' },
    callback = function()
        vim.cmd("set spell")
    end,
})
autocmd('BufWritePre', { -- Replace four spaces with tabs in Makefiles
    pattern = { 'Makefile' },
    callback = function()
        vim.cmd("autocmd BufWritePre Makefile %s/    /\t/e")
    end,
})
autocmd('VimEnter', { -- Restore session on load
    pattern = { '*' },
    callback = function()
        restoreSession()
    end,
})
autocmd('VimLeave', { -- Save session on exit
    pattern = { '*' },
    callback = function()
        saveSession()
    end,
})

require('lsp_config')
require('lualine_config')
require('conform').setup({})
require('autoclose').setup({})
