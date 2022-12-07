vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opts = {
    noremap = true,
    silent = true
}
vim.api.nvim_set_keymap("n", "<leader>tt", ":NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tf", ":NvimTreeFocus<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tg", ":NvimTreeFindFile<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tr", ":NvimTreeRefresh<CR>", opts)

-- empty setup using defaults
require("nvim-tree").setup({
    disable_netrw = true,
    sync_root_with_cwd = true,
    view = {
        hide_root_folder = true
    },
    renderer = {
        icons = {
            show = {
                git = false
            }
        }
    },
    filters = {
        custom = { ".git$" }
    }
})
