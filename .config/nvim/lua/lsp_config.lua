--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

local kindIcons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
}

vim.fn.sign_define('DiagnosticSignError', {text = '', numhl = 'DiagnosticDefaultError'})
vim.fn.sign_define('DiagnosticSignInformation', {text = '', numhl = 'DiagnosticDefaultInformation'})
vim.fn.sign_define('DiagnosticSignHint', {text = '', numhl = 'DiagnosticDefaultHint'})
vim.fn.sign_define('DiagnosticSignInfo', {text = '', numhl = 'DiagnosticDefaultInfo'})
vim.fn.sign_define('DiagnosticSignWarn', {text = '', numhl = 'DiagnosticDefaultWarn'})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})

local defaultSetup = function(server)
    require('lspconfig')[server].setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
end

local lua_ls = function()
    require('lspconfig').lua_ls.setup({
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = {'vim'},
          },
          workspace = {
            library = {
              vim.env.VIMRUNTIME,
            }
          }
        }
      }
    })
end,

require('mason').setup({})

if next(LanguageServers) == nil then
    require('mason-lspconfig').setup({handlers = { defaultSetup, lua_ls }})
else
    require('mason-lspconfig').setup({handlers = { defaultSetup, lua_ls }, ensure_installed = LanguageServers})
end

local cmp = require('cmp')

cmp.setup({
    sources = {
        {
            name = 'nvim_lsp',
        },
        {
            name = 'look',
            keyword_length = 2,
            option = {
                convert_case = true,
                loud = true,
                dict = vim.fn.stdpath("config") .. '/' .. DictFile,
            }
        }
    },

    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format('%s %s', kindIcons[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                buffer = "Buffer",
                nvim_lsp = "LSP",
                luasnip = "LuaSnip",
                nvim_lua = "Lua",
                latex_symbols = "LaTeX",
            })[entry.source.name]

            return vim_item
        end,
    },
    experimental = {
        ghost_text = true,
    },
})
