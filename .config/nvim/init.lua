--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

local opt = vim.opt -- Convenient alias
local keymap = vim.api.nvim_set_keymap -- Convenient alias
local autocmd = vim.api.nvim_create_autocmd -- Convenient alias
local defaultKeybindOptions = { noremap = true, silent = true } -- Default keybind options

LoadPreviousSessionOnLoad = true -- Load previous session or not
EnableImageSupport = false -- Enable image support or not
ImageBackend = 'kitty' -- Image backend to support (kitty/ueberzug)
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
    'markdown_inline', -- Also for Markdown
    'meson', -- For meson
}
LanguageServers = { -- Language servers to use for LSP, run LspInstall <lang> to see available servers
    'html', -- For HTML
    'cssls', -- For CSS
    'clangd', -- For C and C++
    'phpactor', -- For PHP
    'lua_ls', -- For Lua
    'marksman', -- For Markdown
    'swift_mesonls', -- For meson
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
    { '3rd/image.nvim' }, -- Images in Neovim
    { 'nvim-treesitter/nvim-treesitter' }, -- Better syntax highlighting
    { 'akinsho/bufferline.nvim' }, -- Tabs
    { 'nvim-lualine/lualine.nvim' }, -- Status line
    { 'm4xshen/autoclose.nvim' }, -- Autoclose brackets
    { 'stevearc/conform.nvim' }, -- Formatting
    { 'dinhhuy258/git.nvim' }, -- Git integration
    { 'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'nvim-telescope/telescope.nvim',
        },
    },
    { 'lewis6991/gitsigns.nvim' }, -- Provides Git icons
    { 'nvim-tree/nvim-web-devicons' }, -- Provides general icons
    { 'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
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
    { 'uga-rosa/translate.nvim' }, -- Built in translate
    { 'folke/trouble.nvim' }, -- Display warnings and errors neatly
    { 'folke/noice.nvim', event = 'VeryLazy',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
    }, -- Message boxes
    { 'folke/which-key.nvim' }, -- Display possible keybinds
    { 'rainbowhxch/accelerated-jk.nvim' }, -- Accelerated movement
    { 'NvChad/nvim-colorizer.lua' }, -- Colorize #RRGGBB text
    { 'RRethy/vim-illuminate' }, -- Highlight other instances of the cursor position word
    { 'stevearc/aerial.nvim' }, -- Object viewer
    { 'caenrique/swap-buffers.nvim' }, -- Swap buffers
    { 'LunarVim/bigfile.nvim' }, -- Disable heavy features if the file is big
}

require('bootstrap') -- Set up Lazy and plugins.

opt.title = true -- Display title
opt.spelllang = 'en_us' -- Use English (United States) as spellcheck language by default
opt.number = false -- Show line numbers
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
opt.autoread = true -- Automatically reload a file if it has been modified.
opt.swapfile = false -- Don't use a swapfile
opt.writebackup = true -- Back up, to prevent against potential crashes
opt.cursorline = true -- Show the cursor line
opt.undolevels = 10000 -- Allow up to 10000 undos
opt.tabstop = 4 -- Display a tab (\t) as 4 spaces
opt.softtabstop = 4 -- Display a tab (\t) as 4 spaces
opt.shiftwidth = 4 -- Indents for << or >>
opt.spellsuggest = 'best,5' -- Prefer the best suggestions
opt.foldmethod = 'indent' -- Fold based on indents
opt.timeoutlen = 0 -- Show keybinds after this many milliseconds
opt.termguicolors = true -- Enable true color
opt.autochdir = true -- Automatically change directory to the file we're editing
opt.fillchars = { -- Display tab indents using this character
    vert = '▏',
}

-- Keybinds for handling splits
keymap('n', '<C-h>',      '<C-w>h',                                                 defaultKeybindOptions) -- Move left
keymap('n', '<C-j>',      '<C-w>j',                                                 defaultKeybindOptions) -- Move down
keymap('n', '<C-k>',      '<C-w>k',                                                 defaultKeybindOptions) -- Move up
keymap('n', '<C-l>',      '<C-w>l',                                                 defaultKeybindOptions) -- Move right
keymap('n', '<C-s>',      '<cmd>split<cr>',                                         defaultKeybindOptions) -- Split horizontally
keymap('n', '<C-w>',      '<cmd>vsplit<cr>',                                        defaultKeybindOptions) -- Split vertically
keymap('n', '<C-q>',      '<cmd>only<cr>',                                          defaultKeybindOptions) -- Close all buffers except selected
keymap('n', '<A-h>',      '<cmd>vertical resize -10<cr>',                           defaultKeybindOptions) -- Decrease size vertically by 10
keymap('n', '<A-j>',      '<cmd>resize -10<cr>',                                    defaultKeybindOptions) -- Decrease size horizontally by 10
keymap('n', '<A-k>',      '<cmd>resize +10<cr>',                                    defaultKeybindOptions) -- Increase size horizontally by 10
keymap('n', '<A-l>',      '<cmd>vertical resize +10<cr>',                           defaultKeybindOptions) -- Increase size vertically by 10
keymap('n', '<C-A-h>',    '<cmd>lua require("swap-buffers").swap_buffers("h")<cr>', defaultKeybindOptions) -- Decrease size vertically by 10
keymap('n', '<C-A-j>',    '<cmd>lua require("swap-buffers").swap_buffers("j")<cr>', defaultKeybindOptions) -- Decrease size vertically by 10
keymap('n', '<C-A-k>',    '<cmd>lua require("swap-buffers").swap_buffers("k")<cr>', defaultKeybindOptions) -- Decrease size vertically by 10
keymap('n', '<C-A-l>',    '<cmd>lua require("swap-buffers").swap_buffers("l")<cr>', defaultKeybindOptions) -- Decrease size vertically by 10
keymap('n', '<C-t>',      '<cmd>term<cr>',                                          defaultKeybindOptions) -- Open a terminal emulator

-- Keybinds for language/spell
keymap('n', '<F2>',       '<cmd>set spell!<cr>',                                    defaultKeybindOptions) -- Enable spell check
keymap('n', '<F3>',       '<cmd>set spelllang=en_us<cr>',                           defaultKeybindOptions) -- Set spell check langauge to English (United States)
keymap('n', '<F4>',       '<cmd>set spelllang=sv_se<cr>',                           defaultKeybindOptions) -- Set spell check language to Swedish
keymap('n', '<F7>',       '<cmd>silent execute "!setxkbmap us"<cr>',                defaultKeybindOptions) -- Set keyboard layout to English (United States)
keymap('n', '<F8>',       '<cmd>silent execute "!setxkbmap se"<cr>',                defaultKeybindOptions) -- Set keyboard layout to Swedish
keymap('n', 'ca',         'z=',                                                     defaultKeybindOptions) -- Suggest suitable spell check replacements

-- Miscellanious
keymap('n', '<C-n>',      '<cmd>tab :new<cr>',                                      defaultKeybindOptions) -- Create new buffer
keymap('n', 'j',          '<Plug>(accelerated_jk_j)',                               defaultKeybindOptions) -- Move down
keymap('n', 'k',          '<Plug>(accelerated_jk_k)',                               defaultKeybindOptions) -- Move up
keymap('n', 'gj',         '<Plug>(accelerated_jk_gj)',                              defaultKeybindOptions) -- Move down (line wrapping)
keymap('n', 'gk',         '<Plug>(accelerated_jk_gk)',                              defaultKeybindOptions) -- Move up (line wrapping)
keymap('n', 'd',          '"_d',                                                    defaultKeybindOptions) -- Delete without yanking
keymap('x', 'd',          '"_d',                                                    defaultKeybindOptions) -- Delete without yanking
keymap('x', 'p',          '"_dP',                                                   defaultKeybindOptions) -- Paste without clearing clipboard
keymap('n', 'c',          '"_c',                                                    defaultKeybindOptions) -- Change without yanking
keymap('n', 'ZX',         '<cmd>q!<cr>',                                            defaultKeybindOptions) -- Quit without saving
keymap('n', 'Zz',         '<cmd>w!<cr>',                                            defaultKeybindOptions) -- Save
keymap('n', '<C-A>',      'v/{<cr>%',                                               defaultKeybindOptions) -- Select an entire function
keymap('n', '<C-e>',      '<cmd>NvimTreeToggle<cr>',                                defaultKeybindOptions) -- Toggle NvimTree
keymap('n', '.',          '<cmd>TroubleToggle<cr>',                                 defaultKeybindOptions) -- Toggle Trouble
keymap('n', ',',          '<cmd>AerialToggle<cr>',                                  defaultKeybindOptions) -- Toggle Aerial
keymap('n', '<leader>G',  '<cmd>Neogit<cr>',                                        defaultKeybindOptions) -- Toggle Neogit
keymap('n', '<leader>gt', '<cmd>Gitsigns toggle_current_line_blame<cr>',            defaultKeybindOptions) -- Toggle current line blame
keymap('n', '<C-f>',      '<cmd>Telescope fd<cr>',                                  defaultKeybindOptions) -- Toggle Telescope file opener

-- Keybinds for handling tabs
keymap('n', '<A-,>',      '<cmd>BufferLineCyclePrev<cr>',                           defaultKeybindOptions) -- Cycle previous
keymap('n', '<A-.>',      '<cmd>BufferLineCycleNext<cr>',                           defaultKeybindOptions) -- Cycle next
keymap('n', '<C-Tab>',    '<cmd>BufferLineCycleNext<cr>',                           defaultKeybindOptions) -- Also cycle next
keymap('n', '<A-<>',      '<cmd>BufferLineMovePrev<cr>',                            defaultKeybindOptions) -- Move to the previous tab
keymap('n', '<A->>',      '<cmd>BufferLineMoveNext<cr>',                            defaultKeybindOptions) -- Move to the next tab
keymap('n', '<A-1>',      '<cmd>BufferLineGoToBuffer 1<cr>',                        defaultKeybindOptions) -- Move to buffer 1
keymap('n', '<A-2>',      '<cmd>BufferLineGoToBuffer 2<cr>',                        defaultKeybindOptions) -- Move to buffer 2
keymap('n', '<A-3>',      '<cmd>BufferLineGoToBuffer 3<cr>',                        defaultKeybindOptions) -- Move to buffer 3
keymap('n', '<A-4>',      '<cmd>BufferLineGoToBuffer 4<cr>',                        defaultKeybindOptions) -- Move to buffer 4
keymap('n', '<A-5>',      '<cmd>BufferLineGoToBuffer 5<cr>',                        defaultKeybindOptions) -- Move to buffer 5
keymap('n', '<A-6>',      '<cmd>BufferLineGoToBuffer 6<cr>',                        defaultKeybindOptions) -- Move to buffer 6
keymap('n', '<A-7>',      '<cmd>BufferLineGoToBuffer 7<cr>',                        defaultKeybindOptions) -- Move to buffer 7
keymap('n', '<A-8>',      '<cmd>BufferLineGoToBuffer 8<cr>',                        defaultKeybindOptions) -- Move to buffer 8
keymap('n', '<A-9>',      '<cmd>BufferLineGoToBuffer 9<cr>',                        defaultKeybindOptions) -- Move to buffer 9
keymap('n', '<A-0>',      '<cmd>BufferLineGoToBuffer -1<cr>',                       defaultKeybindOptions) -- Move to the last buffer
keymap('n', '<A-p>',      '<cmd>BufferLineTogglePin<cr>',                           defaultKeybindOptions) -- Toggle pin for a tab
keymap('n', '<A-c>',      '<cmd>bdelete<cr>',                                       defaultKeybindOptions) -- Close a tab

autocmd('BufWritePre', { -- Remove trailing spaces
    pattern = { '*' },
    callback = function()
        vim.cmd('%s/\\s\\+$//e')
    end,
})
autocmd('BufReadPre', { -- Enable spell check for all Markdown files
    pattern = { '*.md' },
    callback = function()
        vim.cmd('set spell')
    end,
})
