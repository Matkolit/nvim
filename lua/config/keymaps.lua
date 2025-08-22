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
map("x", "<leader>p", [["_dP]])
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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
-- Copilot chat

map("n", "<C-c>", ":CopilotChatToggle<CR>", { desc = "Open Copilot chat" })

-- Linters quick actio
map({ "n", "i", "v" }, "<C-s>", ":wall<CR>", { desc = "general save file", silent = true })

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

------------ BUFFERS MAP------------
local map = vim.api.nvim_set_keymap
local bufferOpts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", bufferOpts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", bufferOpts)

-- Re-order to previous/next
map("n", "<A-h", "<Cmd>BufferMovePrevious<CR>", bufferOpts)
map("n", "<A-l", "<Cmd>BufferMoveNext<CR>", bufferOpts)

-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", bufferOpts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", bufferOpts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", bufferOpts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", bufferOpts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", bufferOpts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", bufferOpts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", bufferOpts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", bufferOpts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", bufferOpts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", bufferOpts)

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", bufferOpts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", bufferOpts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", bufferOpts)
map("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", bufferOpts)

-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", bufferOpts)
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", bufferOpts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", bufferOpts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", bufferOpts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", bufferOpts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
------------ BUFFERS MAP------------
