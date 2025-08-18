local o = vim.o
local g = vim.g
local opt = vim.opt

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
o.splitbelow = true
o.splitright = true

--o.colorcolumn = "80"
o.foldenable = false
o.fillchars = "eob: "
o.cursorline = true
o.cursorlineopt = "both"
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
