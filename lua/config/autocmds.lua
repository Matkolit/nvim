local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local yank_group = augroup("YankHighLight", {})
local mati_group = augroup("MatiGroup", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "Statement",
      timeout = 40,
    })
  end,
})

autocmd("BufWritePre", {
  group = mati_group,
  pattern = "*",
  command = [[%s/\s\+$//e]], -- removje trailing whitespacev
})

--Netrw better mapping, disabled due nvim-tree
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "netrw",
--   desc = "better mapping",
--   callback = function()
--     local bind = function(lhs, rhs)
--       vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
--     end
--
--     bind("n", "%")
--     bind("l", "<CR>")
--     bind("h", "-^")
--     bind("H", "u")
--     bind(".", "gh")
--   end,
-- });
