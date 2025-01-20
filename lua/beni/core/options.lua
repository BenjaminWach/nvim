vim.g.netrw_liststyle = 3

vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.updatetime = 50

--enleve la surbrillance des mots recherches apres 5s
--vim.opt.hlsearch = false
vim.cmd("set hlsearch")
vim.defer_fn(function() vim.cmd("nohlsearch") end, 5000)

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.smartindent = true

vim.opt.wrap = false

--file managemenent: no .swp/backup ; historic "on"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--surbrillance et split de previsualisation des commandes de substitution :s/old/new/g
vim.opt.incsearch = true
vim.opt.inccommand = "split"

--ignore the Maj ou Minuscule: foo -> Foo/FOO/foo/fOo etc.. / smartcase permet d'accepter des Majs: Foo -> Foo
vim.opt.ignorecase = true
vim.opt.smartcase = true

--palette de couleurs 24 bits on
vim.opt.termguicolors = true
vim.opt.background = "dark"

--lignes visibles autour du cursor
vim.opt.scrolloff = 8
--affichage des num de column
vim.opt.signcolumn = "yes"
--surbrillance des column
vim.opt.colorcolumn = "88"

--supprimer tout
vim.opt.backspace = { "start", "eol", "indent" }

--split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

--autorisation des "." comme nom de fichiers
vim.opt.isfname:append("@-@")

--autorisation/facilitation du presse-papier vim/system
vim.opt.clipboard:append("unnamedplus")

--active la souris ("a" pour tous les modes vim)
vim.opt.mouse = "a"

