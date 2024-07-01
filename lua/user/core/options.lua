vim.opt.backup = false -- creates a backup file
vim.opt.swapfile = false -- creates a swapfile
vim.opt.undofile = true -- enable persistent undo
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.cursorline = true -- highlight the current line
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.wrap = false -- display lines as one long line
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`

vim.opt.showtabline = 0 -- always show tabs
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.softtabstop = 2 -- number of spaces tabs count for while editing
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true -- make indenting smarter

vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99 -- using ufo provider need a large value, feel free to decrease the value
vim.opt.foldenable = true -- enable folding

vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.incsearch = true -- while typing a search command, show where the pattern matches
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.smartcase = true -- Better search
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.inccommand = "split" -- Show live preview of substitute commands

vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.wildignore:append { "*/node_modules/*" } -- Ignore when expanding wildcards, completing file or directory names

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.laststatus = 3

vim.opt.grepprg = "rg --vimgrep" -- Use ripgrep for grepping
vim.opt.grepformat = "%f:%l:%c:%m" -- Set the grep format

vim.g.markdown_recommended_style = 0 -- Disable default markdown styles (see https://www.reddit.com/r/neovim/comments/z2lhyz/comment/ixjb7je)

vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.showcmd = false

vim.opt.pumheight = 15
vim.opt.pumblend = 3

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
