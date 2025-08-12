local servers_to_install = require("config.lsp.default_config").servers_to_install

local opts = {
  ensure_installed = servers_to_install,
}

require("mason-lspconfig").setup(opts)
