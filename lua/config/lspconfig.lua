local on_attach = require("config.lsp.default_config").on_attach
local capabilities = require("config.lsp.default_config").capabilities
local on_init = require("config.lsp.default_config").on_init

local default_servers_config = {
  "lua_ls",
  "cssls",
  "tailwindcss",
  "emmet_ls",
  "html",
  "jsonls",
  "cspell_ls",
}

for _, lsp in pairs(default_servers_config) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

vim.lsp.enable(default_servers_config)

vim.lsp.config("cspell_ls", {
  cmd = { "cspell-lsp", "--stdio", "--config", vim.fn.stdpath("config") .. "/cspell.json" },
})

local vtsls_config = require("config.lsp.vue").vtsls_config
local vue_ls_config = require("config.lsp.vue").vue_ls_config

vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)

vim.lsp.enable({ "vtsls", "vue_ls" })

local base_on_attach = vim.lsp.config.eslint.on_attach

vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    if not base_on_attach then
      return
    end

    base_on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})
