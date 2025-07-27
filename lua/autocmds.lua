require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("YankHighLight", {})
local mati_group = augroup("MatiGroup", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

autocmd("BufWritePre", {
  group = mati_group,
  pattern = "*",
  command = [[%s/\s\+$//e]], -- remove trailing whitespacev
})
