require("nvchad.options")

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- add yours here!
o.nu = true
o.relativenumber = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.smartindent = true

o.wrap = true
o.breakindent = true
o.linebreak = true

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.scrolloff = 8
o.signcolumn = "yes"

o.smoothscroll = true
o.updatetime = 50

o.colorcolumn = "80"
o.foldenable = false
