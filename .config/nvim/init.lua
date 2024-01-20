--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

local opt = vim.opt -- Convenient alias
local keymap = vim.api.nvim_set_keymap -- Convenient alias
local autocmd = vim.api.nvim_create_autocmd -- Convenient alias
local defaultKeybindOptions = { noremap = true, silent = true } -- Default keybind options

LoadPreviousSessionOnLoad = true -- Load previous session or not
SessionFile = '~/.config/nvim/.session.nvim' -- File where the previous buffer is stored
LeaderKey = ' ' -- The leader key to use.
MaxAccelerationSpeed = 300 -- Max speed for j/k/gj/gk bindings.
Theme = 'oxocarbon' -- Theme to use
Languages = { -- Languages to support - Used to configure highlighting
    'html', -- For HTML
    'css', -- For CSS
    'c', -- For C
    'cpp', -- For C++
    'php', -- For PHP
    'lua', -- For Lua
    'markdown', -- For Markdown
}
LanguageServers = { -- Language servers to use for LSP, run LspInstall <lang> to see available servers
    'html', -- For HTML
    'cssls', -- For CSS
    'clangd', -- For C and C++
    'phpactor', -- For PHP
    'lua_ls', -- For Lua
    'marksman', -- For Markdown
}
Themes = {
    { 'nyoom-engineering/oxocarbon.nvim' }, -- Oxocarbon
    --[[
    { 'rmehri01/onenord.nvim', branch = 'main'  }, -- One Nord theme
    { 'romgrk/doom-one.vim' }, -- Doom-One theme
    { 'catppuccin/nvim' }, -- Catppuccin theme(s)
    ]]--
} -- Themes to download as plugins
Plugins = { -- Plugins to use
    { 'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    }, -- Fuzzy-finding
    { 'nvim-treesitter/nvim-treesitter' }, -- Better syntax highlighting
    { 'akinsho/bufferline.nvim' }, -- Tabs
    { 'nvim-lualine/lualine.nvim' }, -- Status line
    { 'm4xshen/autoclose.nvim' }, -- Autoclose brackets
    { 'stevearc/conform.nvim' }, -- Formatting
    { 'dinhhuy258/git.nvim' }, -- Git integration
    { 'lewis6991/gitsigns.nvim' }, -- Provides Git icons
    { 'nvim-tree/nvim-web-devicons' }, -- Provides general icons
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
    { 'folke/noice.nvim', event = "VeryLazy",
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        opts = {},
    }, -- Message boxes
    { 'rainbowhxch/accelerated-jk.nvim' }, -- Accelerated movement
    { 'NvChad/nvim-colorizer.lua' }, -- Colorize #RRGGBB text
    { 'RRethy/vim-illuminate' }, -- Highlight other instances of the cursor position word
    { 'LunarVim/bigfile.nvim' }, -- Disable heavy features if the file is big
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
opt.fillchars = {
    vert = '▏',
}

-- Keybinds for handling splits
keymap('n', '<C-h>',      '<C-w>h',                                  defaultKeybindOptions)
keymap('n', '<C-j>',      '<C-w>j',                                  defaultKeybindOptions)
keymap('n', '<C-k>',      '<C-w>k',                                  defaultKeybindOptions)
keymap('n', '<C-l>',      '<C-w>l',                                  defaultKeybindOptions)
keymap('n', '<C-s>',      '<cmd>split<cr>',                          defaultKeybindOptions)
keymap('n', '<C-w>',      '<cmd>vsplit<cr>',                         defaultKeybindOptions)
keymap('n', '<C-q>',      '<cmd>only<cr>',                           defaultKeybindOptions)
keymap('n', '<C-t>',      '<cmd>term<cr>',                           defaultKeybindOptions)
keymap('n', '<C-f>',      '<cmd>Telescope fd<cr>',                   defaultKeybindOptions)
keymap('n', 'H',          '<cmd>vertical resize -10<cr>',            defaultKeybindOptions)
keymap('n', 'J',          '<cmd>resize -10<cr>',                     defaultKeybindOptions)
keymap('n', 'K',          '<cmd>resize +10<cr>',                     defaultKeybindOptions)
keymap('n', 'L',          '<cmd>vertical resize +10<cr>',            defaultKeybindOptions)

-- Keybinds for language/spell
keymap('n', '<F2>',       '<cmd>set spell!<cr>',                     defaultKeybindOptions)
keymap('n', '<F3>',       '<cmd>set spelllang=en_us<cr>',            defaultKeybindOptions)
keymap('n', '<F4>',       '<cmd>set spelllang=sv_se<cr>',            defaultKeybindOptions)
keymap('n', '<F7>',       '<cmd>silent execute "!setxkbmap us"<cr>', defaultKeybindOptions)
keymap('n', '<F8>',       '<cmd>silent execute "!setxkbmap se"<cr>', defaultKeybindOptions)
keymap('n', 'ca',         'z=',                                      defaultKeybindOptions)

-- Miscellanious
keymap('n', '<C-n>',      '<cmd>tab :new<cr>',                            defaultKeybindOptions)
keymap('n', 'j',          '<Plug>(accelerated_jk_j)',                defaultKeybindOptions)
keymap('n', 'k',          '<Plug>(accelerated_jk_k)',                defaultKeybindOptions)
keymap('n', 'gj',         '<Plug>(accelerated_jk_gj)',               defaultKeybindOptions)
keymap('n', 'gk',         '<Plug>(accelerated_jk_gk)',               defaultKeybindOptions)
keymap('n', 'd',          '"_d',                                     defaultKeybindOptions)
keymap('x', 'd',          '"_d',                                     defaultKeybindOptions)
keymap('x', 'p',          '"_dP',                                    defaultKeybindOptions)
keymap('n', 'c',          '"_c',                                     defaultKeybindOptions)
keymap('n', 'ZX',         '<cmd>q!<cr>',                             defaultKeybindOptions)
keymap('n', 'Zz',         '<cmd>w!<cr>',                             defaultKeybindOptions)
keymap('n', '<C-A>',      'v/{<cr>%',                                defaultKeybindOptions)
keymap('n', '<C-e>',      '<cmd>NvimTreeToggle<cr>',                 defaultKeybindOptions)
keymap('n', '<C-b>',      '<cmd>TroubleToggle<cr>',                  defaultKeybindOptions)

-- Keybinds for handling tabs
keymap('n', '<A-,>',      '<cmd>BufferLineCyclePrev<cr>',            defaultKeybindOptions)
keymap('n', '<A-.>',      '<cmd>BufferLineCycleNext<cr>',            defaultKeybindOptions)
keymap('n', '<C-Tab>',    '<cmd>BufferLineCycleNext<cr>',            defaultKeybindOptions)
keymap('n', '<A-<>',      '<cmd>BufferLineMovePrev<cr>',             defaultKeybindOptions)
keymap('n', '<A->>',      '<cmd>BufferLineMoveNext<cr>',             defaultKeybindOptions)
keymap('n', '<A-1>',      '<cmd>BufferLineGoToBuffer 1<cr>',         defaultKeybindOptions)
keymap('n', '<A-2>',      '<cmd>BufferLineGoToBuffer 2<cr>',         defaultKeybindOptions)
keymap('n', '<A-3>',      '<cmd>BufferLineGoToBuffer 3<cr>',         defaultKeybindOptions)
keymap('n', '<A-4>',      '<cmd>BufferLineGoToBuffer 4<cr>',         defaultKeybindOptions)
keymap('n', '<A-5>',      '<cmd>BufferLineGoToBuffer 5<cr>',         defaultKeybindOptions)
keymap('n', '<A-6>',      '<cmd>BufferLineGoToBuffer 6<cr>',         defaultKeybindOptions)
keymap('n', '<A-7>',      '<cmd>BufferLineGoToBuffer 7<cr>',         defaultKeybindOptions)
keymap('n', '<A-8>',      '<cmd>BufferLineGoToBuffer 8<cr>',         defaultKeybindOptions)
keymap('n', '<A-9>',      '<cmd>BufferLineGoToBuffer 9<cr>',         defaultKeybindOptions)
keymap('n', '<A-0>',      '<cmd>BufferLineGoToBuffer -1<cr>',        defaultKeybindOptions)
keymap('n', '<A-p>',      '<cmd>BufferLineTogglePin<cr>',            defaultKeybindOptions)
keymap('n', '<A-c>',      '<cmd>bdelete<cr>',                        defaultKeybindOptions)

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
