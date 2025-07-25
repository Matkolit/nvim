local M = {}

function M.on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, opts)
    opts = vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- Navigation mappings
  map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
  map("n", "gr", vim.lsp.buf.references, { desc = "References" })
  map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
  map("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
  map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

  -- Documentation and help
  map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
  map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
  map("i", "<C-Space>", vim.lsp.buf.signature_help, { desc = "Signature Help (Insert Mode)" })

  -- This is going to get me canceled
  map({ "n", "v", "i" }, "<C-z>", "<ESC>")

  -- Code actions and refactoring
  map({ "n", "v" }, "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, { desc = "Code Action" })
  map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })

  -- Formatting mappings
  map({ "n", "v" }, "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Format Code" })

  -- Chama o on_attach padrão do nvchad
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)
end

return M
