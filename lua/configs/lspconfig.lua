local on_attach = require("configs.lsp.keymaps")
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

lspconfig.servers = {
  "vtsls",
  "vue_ls",
  "jsonls",
  "eslint",
}

local default_servers = {
  "lua_ls",
  "html",
  "cssls",
  "tailwindcss",
  "eslint",
  "jsonls",
}

for _, lsp in ipairs(default_servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

local vue_configs = require("configs.lsp.vue")
local vtsls = vue_configs.vtsls()
local vue_ls = vue_configs.vue_ls()

local eslint = require("configs.lsp.eslint")

vim.lsp.config("vue_ls", vue_ls)
vim.lsp.config("vtsls", vtsls)
vim.lsp.config("eslint", eslint)

vim.lsp.enable(lspconfig.servers)
vim.lsp.enable(default_servers)
