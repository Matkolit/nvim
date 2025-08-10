local on_attach = require("config.lsp.default_config").on_attach
local capabilities = require("config.lsp.default_config").capabilities
local on_init = require("config.lsp.default_config").on_init

local default_servers_config = {
  "lua_ls",
  "html",
  "cssls",
  "tailwindcss",
  "eslint",
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

local eslint_config = require("config.lsp.eslint")
vim.lsp.config("eslint", eslint_config)
--
-- local vue_config = require("config.lsp.vue")
-- vim.lsp.config("vtsls", vue_config.vtsls_config)
-- vim.lsp.config("vue_ls", vue_config.vue_ls_config)
-- vim.lsp.enable({ "vtsls", "vue_ls" })

vim.lsp.config("cspell_ls", {
  cmd = { "cspell-lsp", "--stdio", "--config", vim.fn.stdpath("config") .. "/cspell.json" },
})

local vue_language_server_path = vim.fn.expand("$MASON/packages")
  .. "/vue-language-server"
  .. "/node_modules/@vue/language-server"

local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}

local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
}

local vue_ls_config = {}

-- nvim 0.11 or above
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.config("ts_ls", ts_ls_config)
vim.lsp.enable({ "ts_ls", "vue_ls", "vtsls" }) -- If using `ts_ls` replace `vtsls` to `ts_ls`
