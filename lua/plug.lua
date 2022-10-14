-- [[ plug.lua ]]

return require('packer').startup(function(use)
    -- [[ Plugins Go Here ]]
    use {                                              -- filesystem navigation
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
    }

    -- [[ Theme ]]
    use { 'mhinz/vim-startify' }                       -- start screen
    use { 'DanilaMihailov/beacon.nvim' }               -- cursor jump
    use {
        'nvim-lualine/lualine.nvim',                     -- statusline
        requires = {'kyazdani42/nvim-web-devicons',
                opt = true}
        }
    use { 'Mofiqul/dracula.nvim' }

    use {
        'nvim-telescope/telescope.nvim',                 -- fuzzy finder
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',     -- fuzzy finder engine
        run = 'make' }
    use { 'majutsushi/tagbar' }                        -- code structure
    use { 'Yggdroot/indentLine' }                      -- see indentation
    use { 'tpope/vim-fugitive' }                       -- git integration
    use { 'junegunn/gv.vim' }                          -- commit history
    use { 'windwp/nvim-autopairs' }

    use 'lewis6991/impatient.nvim'                     -- speed up boot time
    use 'preservim/nerdcommenter'                      -- commenting
    
    use {
        'romgrk/barbar.nvim',                           -- tabline
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use 'nvim-treesitter/nvim-treesitter'               -- parser tool
    use 'nvim-treesitter/nvim-treesitter-refactor'      -- refactor for treesitter
    use 'neovim/nvim-lspconfig'                         -- lsp client config 
    use 'williamboman/mason.nvim'                       -- package manager for lsp
    -- LSP plugins
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu' }

    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'onsails/lspkind-nvim'

    -- Git improvements
    use 'airblade/vim-gitgutter'
    use 'f-person/git-blame.nvim'
end
--    config = {
--        package_root = vim.fn.stdpath('config') .. '/site/pack'
--    }
)
