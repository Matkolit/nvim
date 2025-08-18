local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>pv", ":Ex<CR>")
map("n", "G", "Gzz", { noremap = true })

-- Source the current file
map("n", "<leader>so", ":so %<CR>", { desc = "Source current file", silent = true })

-- Copy to clipboard --
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

-- Window management
map("n", "<leader>,", ":vertical resize +30<CR>", { desc = "Increase window width" })
map("n", "<leader>.", ":vertical resize -30<CR>", { desc = "Decrease window width" })
map({ "n", "v", "i" }, "<C-k>", "<C-w>k", { desc = "Move to the window above" })
map({ "n", "v", "i" }, "<C-j>", "<C-w>j", { desc = "Move to the window below" })
map({ "n", "v", "i" }, "<C-l>", "<C-w>l", { desc = "Move to the window to the right" })
map({ "n", "v", "i" }, "<C-h>", "<C-w>h", { desc = "Move to the window to the left" })
map("n", "<leader>q", ":q <CR>", { desc = "Close current window", silent = true })
map("n", "<leader>b", ":vnew<CR>", { desc = "new buffer in vertical split", noremap = true, silent = true })
-- Copilot remap
map("i", "<M-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

-- Linters quick actio
map({ "n", "i" }, "<C-s>", ":w<CR>", { desc = "general save file" })

map("n", "<leader>cfm", function()
  require("cellular-automaton").start_animation("make_it_rain")
end)

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Diagnostic
map("n", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Todo
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
