--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

local cmd = vim.cmd
local opt = vim.opt
local o = vim.o
local api = vim.api
local keymap = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd
local sessionFile = vim.fn.expand('~/.config/nvim/.session.nvim')

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
opt.cursorline = false -- Don't show the cursor line
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
    colorscheme elflord
    highlight Normal ctermfg=grey ctermbg=lightgray guifg=#ffffff guibg=#222222
    highlight Folded ctermfg=grey ctermbg=lightgray guifg=#afeeee guibg=#333333
    highlight SpellBad guisp=red gui=undercurl guifg=none guibg=none ctermfg=none ctermbg=none term=underline cterm=undercurl
    highlight SpellCap guisp=yellow gui=undercurl guifg=none guibg=none ctermfg=none ctermbg=none term=underline cterm=undercurl
    filetype plugin indent on
]])

keymap('n', '<C-h>', '<C-w>h', { noremap = true })
keymap('n', '<C-j>', '<C-w>j', { noremap = true })
keymap('n', '<C-k>', '<C-w>k', { noremap = true })
keymap('n', '<C-l>', '<C-w>l', { noremap = true })
keymap('n', '<C-s>', ':split<CR>', { noremap = true })
keymap('n', '<C-w>', ':vsplit<CR>', { noremap = true })
keymap('n', '<C-q>', ':only<CR>', { noremap = true })
keymap('n', '<C-t>', ':term<CR>', { noremap = true })
keymap('n', '<F2>', ':set spell!<CR>', { noremap = true })
keymap('n', '<F3>', ':set spelllang=en_us<CR>', { noremap = true })
keymap('n', '<F4>', ':set spelllang=sv_se<CR>', { noremap = true })
keymap('n', '<F7>', ':silent execute "!setxkbmap us"<CR>', { noremap = true })
keymap('n', '<F8>', ':silent execute "!setxkbmap se"<CR>', { noremap = true })
keymap('n', '<C-R>', '[sz=', { noremap = true })
keymap('n', '<C-e>', 'z=', { noremap = true })
keymap('n', '<C-b>', ':!ninja -C build<CR>', { noremap = true })
keymap('n', 'H', ':vertical resize -10<CR>', { noremap = true })
keymap('n', 'J', ':resize -10<CR>', { noremap = true })
keymap('n', 'K', ':resize +10<CR>', { noremap = true })
keymap('n', 'L', ':vertical resize +10<CR>', { noremap = true })
keymap('n', 'd', '"_d', { noremap = true })
keymap('x', 'd', '"_d', { noremap = true })
keymap('x', 'p', '"_dP', { noremap = true })
keymap('n', 'c', '"_c', { noremap = true })
keymap('n', '<C-A>', 'v/{<cr>%', { noremap = true })

function saveSession() -- Save the current session
    vim.cmd('mksession! ' .. sessionFile)
end

function restoreSession() -- Restore the last session
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
