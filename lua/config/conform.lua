local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    vue = { "prettierd" },
    typescript = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    css = { "prettierd" },
    typescriptreact = { "prettierd" },
  },
  formatters = {
    prettierd = {
      require_cwd = true,
    },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
