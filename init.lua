-- GENERAL SETTINGS
-- Must be set before plugins load
vim.o.termguicolors = true

-- Dependencies
require("keybindings")
require("plugins")
require("lsp")

-- Make relative line numbers default. The current line number will be shown as well as relative numbering from that current line. It makes navigating around code easier.
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode. Sometimes it's easier to scroll using the touchpad for example.
vim.o.mouse = 'a'

-- Enable break indent.
vim.o.breakindent = true

-- Save undo history.
vim.opt.undofile = true

-- Case insensitive searching unless /C or capital in search.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time.
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set default tab size
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Set colorscheme defaults (order is important here).
vim.o.background = 'dark'
vim.cmd [[colorscheme onedark]]

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Set settings specific for neovide
vim.cmd [[
  if exists("g:neovide")
    set guifont=FuraCode\ Nerd\ Font:h11
    let g:neovide_refresh_rate = 144
    let g:neovide_cursor_animation_length = 0.02
    let g:neovide_scroll_animation_length = 1.0
endif
]]

-- Copy and paste from clipboard
vim.cmd [[set clipboard+=unnamedplus]]

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
