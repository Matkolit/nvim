require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Git mappings
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Git preview hunk" })

map("i", "<M-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

map("n", "<C-s>", function()
  vim.cmd("w")
  vim.lsp.buf.code_action({
    context = { only = { "source.fixAll" } },
    apply = true,
    filter = function(action)
      return action.kind == "source.fixAll.eslint"
    end,
  })
end, { desc = "eneral save file" })

map("n", "<leader>cfm", function()
  require("cellular-automaton").start_animation("make_it_rain")
end)
