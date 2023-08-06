-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn     = "yes"

-- Tabs and Indentation
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smartindent = true
vim.opt.wrap        = false

-- Files
vim.opt.swapfile = false
vim.opt.backup   = false
vim.opt.undodir  = os.getenv("HOME") .. "/.cache/nvim/undo"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch  = false
vim.opt.incsearch = true

-- Colors
vim.opt.termguicolors = true

-- Netrw
vim.g.netrw_browse_split = false
vim.g.netrw_banner       = false
vim.g.netrw_winsize      = 25

-- Misc.
vim.opt.scrolloff  = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"
