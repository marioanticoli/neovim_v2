-- [[ plug.lua ]]

-- Auto setup Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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

    use 'navarasu/onedark.nvim'                         -- onedark theme

    use {
        'nvim-telescope/telescope.nvim',                 -- fuzzy finder
        requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-telescope/telescope-live-grep-args.nvim'}
        }
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
    use 'L3MON4D3/LuaSnip'
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu' }

    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'onsails/lspkind-nvim'

    -- Git improvements
    use 'airblade/vim-gitgutter'
    use 'f-person/git-blame.nvim'

    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('trouble').setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use 'MunifTanjim/exrc.nvim'                       -- per project config

    use 'numToStr/FTerm.nvim'                         -- floating terminal

    use 'MattesGroeger/vim-bookmarks'                 -- bookmarks 

    use {                                             -- suggest keys
      'folke/which-key.nvim',
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
        }
      end
    }

    use 'tom-anders/telescope-vim-bookmarks.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end
--    config = {
--        package_root = vim.fn.stdpath('config') .. '/site/pack'
--    }
)
