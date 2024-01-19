--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --

    Dependencies:

      - Neovim 0.9 or later
      -
]]--

local cmd = vim.cmd -- Convenient alias
local opt = vim.opt -- Convenient alias
local highlight = vim.api.nvim_set_hl -- Convenient alias
local keymap = vim.api.nvim_set_keymap -- Convenient alias
local autocmd = vim.api.nvim_create_autocmd -- Convenient alias
local sessionFile = '~/.config/nvim/.session.nvim' -- File where the previous buffer is stored

Theme = 'doom-one' -- Theme to use
Languages = { -- Used to configure highlighting
    'html',
    'css',
    'c',
    'cpp', -- The best language
    'php',
    'lua',
    'vim',
    'vimdoc',
    'markdown',
} -- Languages to support
Plugins = { -- Plugins to use
    { 'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    }, -- Fuzzy-finding
    { 'nvim-treesitter/nvim-treesitter' }, -- Better syntax highlighting
    { 'nvim-lualine/lualine.nvim' }, -- Status line
    { 'm4xshen/autoclose.nvim' }, -- Autoclose brackets
    { 'romgrk/doom-one.vim' }, -- Doom-One theme
    { 'stevearc/conform.nvim' }, -- Formatting
    { 'tpope/vim-fugitive' }, -- Git integration
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
        },
    }, -- Server auto-install
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
        },
    }, -- LSP
    { 'nvim-tree/nvim-tree.lua' }, -- File manager
    { 'lukas-reineke/indent-blankline.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    }, -- Indentation blankline
    { 'folke/trouble.nvim' }, -- Display warnings and errors neatly
    { 'uga-rosa/translate.nvim' }, -- Built in translate
}

require('bootstrap') -- Set up Lazy and plugins.

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

-- Fallback colors and undercurl, if supported
highlight(0, 'Normal', { fg='#ffffff', bg='#222222' })
highlight(0, 'EndOfBuffer', { fg='#ffffff', bg='#222222' })
highlight(0, 'Folded', { fg='#afeeee', bg='#333333' })
highlight(0, 'SpellBad', { undercurl=true, fg='#ff0000' })
highlight(0, 'SpellCap', { undercurl=true, fg='#ffff00' })

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
keymap('n', '<C-e>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
keymap('n', '<C-b>', ':TroubleToggle<cr>', { noremap = true, silent = true })
keymap('n', 'ca', 'z=', { noremap = true, silent = true })
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
        local _sessionFile = vim.fn.expand(sessionFile)
        if vim.fn.argc() == 0 then
            if vim.fn.filereadable(_sessionFile) == 1 then
                vim.cmd('source ' .. _sessionFile)
                vim.cmd("filetype detect")
            end
        end
    end,
})
autocmd('VimLeave', { -- Save session on exit
    pattern = { '*' },
    callback = function()
        local _sessionFile = vim.fn.expand(sessionFile)
        vim.cmd('mksession! ' .. _sessionFile)
    end,
})

-- Set up various plugins
require('conform_config')
require('autoclose_config')
require('lsp_config')
require('lualine_config')
require('ibl_config')
require('tree_config')
require('ts_config')
require('theme_config')
require('trouble_config')
require('translate_config')
