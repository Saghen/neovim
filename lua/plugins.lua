-- Install packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

-- Run PackerCompile whenever plugins.lua is updated
vim.api.nvim_exec([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]], false)

-- Define our plugins
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager itself
    use 'nvim-lua/plenary.nvim' -- Utils for other libs

    -- Movement
    use 'justinmk/vim-sneak' -- s{char}{char} to move around
    use { -- It's like rofi but 100x better in every way
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { -- Fuzzy search for telescope
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
    use { -- Z integration for telescope
        'nvim-telescope/telescope-z.nvim',
        requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' }, { 'nvim-telescope/telescope.nvim' } }
    }
    use { -- Project integration for telescope
        'nvim-telescope/telescope-project.nvim'
    }
    use { -- File browser for telescope
        'nvim-telescope/telescope-file-browser.nvim'
    }

    -- UI
    use 'navarasu/onedark.nvim' -- Theme
    use { -- File explorer
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use { -- Tabs
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end,
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    })
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    -- Syntax UI
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use "lukas-reineke/indent-blankline.nvim"
    use {
        "yamatsum/nvim-cursorline",
        config = function()
            require("nvim-cursorline").setup {
                cursorline = {
                    enabled = false
                },
                cursorword = {
                    enabled = true
                }
            }
        end
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim' -- Allow non-LSP sources to hook into LSP
    use { -- Autocompletion
        "hrsh7th/nvim-cmp",
        requires = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'quangnguyen30192/cmp-nvim-ultisnips',
            'hrsh7th/cmp-nvim-lua', 'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
            'f3fora/cmp-spell', 'hrsh7th/cmp-emoji' }
    }
    use 'smjonas/inc-rename.nvim' -- Show renames in real time
    use 'MunifTanjim/prettier.nvim' -- Formatter for some languages
    use 'gpanders/editorconfig.nvim' -- Respect .editorconfig
    use {
        "someone-stole-my-name/yaml-companion.nvim",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        }
    }
    use {
        "narutoxy/dim.lua",
        requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
        config = function()
            require('dim').setup({})
        end
    }

    -- Add closing brackets automatically
    use 'jiangmiao/auto-pairs'

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    -- Rust
    -- Crates
    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    -- LSP and other
    use 'simrat39/rust-tools.nvim'

    -- Color #3498DB in it's color
    use 'norcalli/nvim-colorizer.lua'

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Conifgure plugins
require("plugs/bufferline")
require("plugs/colorizer")
require("plugs/crates")
require("plugs/inc-rename")
require("plugs/indent-blankline")
require("plugs/lualine")
require("plugs/null-ls")
require("plugs/nvim-cmp")
require("plugs/nvim-tree")
require("plugs/onedark")
require("plugs/prettier")
require("plugs/sneak")
require("plugs/telescope")
require("plugs/treesitter")
