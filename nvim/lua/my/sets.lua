vim.opt.number = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { lead = ".", trail = ".", tab = "⇥-" }
vim.opt.fillchars = { eob = " " }
vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "80"
-- vim.opt.scrolloff = 12
vim.opt.updatetime = 50
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.shortmess = "I"

-- File Editing
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- Indentation
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Statusline
vim.opt.showmode = false
vim.opt.statusline = "%#ModeMsg#%{v:lua.vim.fn.mode()}%* %f %m %= %l:%c"
vim.opt.laststatus = 2

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_keepdir = 0
vim.g.netrw_localmkdir = "mkdir -p"
vim.g.netrw_localcopycmd = "cp -r"
vim.g.netrw_localrmdir = "rm -r"
vim.g.netrw_altv = 1
vim.g.netrw_browse_split = 4
