vim.opt.guicursor = ""
vim.opt.clipboard = "unnamed"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = "$HOME/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 60
--vim.opt.signcolumn = "yes"
--vim.opt.colorcolumn = "80"
vim.opt.completeopt = "menuone,noinsert,noselect"

vim.opt.updatetime = 100

-- :h shell-powershell
-- To use PowerShell:
vim.cmd("let &shell = executable('pwsh') ? 'pwsh' : 'powershell'")
vim.cmd(
	"let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'"
)
vim.cmd("let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
vim.cmd("let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
vim.cmd("set shellquote= shellxquote=")
