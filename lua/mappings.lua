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
map("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>", { desc = "Git preview hunk" })
map("n", "[g", ":Gitsigns prev_hunk<CR>", { desc = "Git previous hunk" })
map("n", "]g", ":Gitsigns next_hunk<CR>", { desc = "Git next hunk" })
-- map("n", )

-- Window management

map("n", "<leader>,", ":vertical resize +30<CR>", { desc = "Increase wnidow width" })
map("n", "<leader>.", ":vertical resize -30<CR>", { desc = "Decrease window width" })

map("i", "<M-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

map("n", "<C-s>", function()
  vim.cmd("w")
  local is_eslint_active = vim.lsp.get_clients({ name = "eslint" })
  if #is_eslint_active > 0 then
    vim.cmd("LspEslintFixAll")
  end
end, { desc = "eneral save file" })

map("n", "<leader>cfm", function()
  require("cellular-automaton").start_animation("make_it_rain")
end)
