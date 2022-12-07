-- KEYBINDINGS
-- Plugin specific keybindings are in the plugin's config files.

-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap. In general, the `nvim_set_keymap` is the function we can use to create any keymap you'd wish. I tend to keep those related to the whole editor here, while leaving the ones for specific plugins to their own configuration files. That way if I ever remove or change plugins I can keep my keybindings clean.
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Hide search highlight on escape cause it's intuitive https://tech.serhatteker.com/post/2020-03/clear-search-highlight-in-vim/
vim.api.nvim_set_keymap('', '<esc>', ':noh <CR>', { noremap = true, silent = true })
