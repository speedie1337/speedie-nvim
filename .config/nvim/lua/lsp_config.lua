--[[
            speedie's neovim configuration
    -- https://git.speedie.site/speedie/speedie-nvim --
]]--

if vim.fn.has('nvim-0.8') == 1 or vim.fn.has('nvim-0.9') == 1 or vim.fn.has('nvim-1') == 1 then
    local lsp_zero = require('lsp-zero')
    lsp_zero.on_attach(function(client, bufnr) lsp_zero.default_keymaps({buffer = bufnr}) end)

    require('mason').setup({})
    require('mason-lspconfig').setup({handlers = { lsp_zero.default_setup }, ensure_installed = LanguageServers})
end
