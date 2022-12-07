local telescope = require('telescope')

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        project = {
            base_dirs = {
                { '/mnt/storage/code', max_depth = 3 },
            },
            order_by = "asc",
            sync_with_nvim_tree = true, -- default false
        },
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
telescope.load_extension('z')
telescope.load_extension('project')
telescope.load_extension('file_browser')
telescope.load_extension("yaml_schema")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', telescope.extensions.project.project, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fS', builtin.lsp_dynamic_workspace_symbols, {})
vim.api.nvim_set_keymap("n", "<space>fy", ":Telescope yaml_schema", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<space>fb",
    ":Telescope file_browser",
    { noremap = true }
)
vim.api.nvim_set_keymap('n', '<leader>fz', [[<cmd>lua require'telescope'.extensions.z.list{}<CR>]],
    { noremap = true, silent = true })
