local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    vue = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
  },
  formatters = {
    prettier = {
      require_cwd = true,
    },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = false,
    bufnr = 0,
  },
}

require("conform").setup(options)
