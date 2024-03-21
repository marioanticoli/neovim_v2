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
    use { "wbthomason/packer.nvim" }

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
    --use { "catppuccin/nvim", as = "catppuccin" }
    --use "olimorris/onedarkpro.nvim"

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

    use { 'Yggdroot/indentLine' }                      -- see indentation
    use { 'tpope/vim-fugitive' }                       -- git integration
    use { 'windwp/nvim-autopairs' }

    use 'lewis6991/impatient.nvim'                     -- speed up boot time
    use 'preservim/nerdcommenter'                      -- commenting
    
    use {
        'romgrk/barbar.nvim',                           -- tabline
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use 'nvim-treesitter/nvim-treesitter'               -- parser tool
    -- maybe delete???
    use 'nvim-treesitter/nvim-treesitter-refactor'      -- refactor for treesitter
    use 'neovim/nvim-lspconfig'                         -- lsp client config 
    use 'williamboman/mason.nvim'                       -- package manager for lsp
    -- LSP plugins
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use {
        'hrsh7th/cmp-nvim-lsp-signature-help',
        requires = {
          'hrsh7th/nvim-cmp',
          'hrsh7th/cmp-nvim-lsp'
        }
    }

    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {                                               -- snippets
        'L3MON4D3/LuaSnip',
        dependencies = {'rafamadriz/friendly-snippets'}
    }
    use 'rafamadriz/friendly-snippets'
    use 'benfowler/telescope-luasnip.nvim'
        
    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'onsails/lspkind-nvim'

    -- Git improvements
    use 'f-person/git-blame.nvim'
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require('gitsigns').setup()
        require("scrollbar.handlers.gitsigns").setup()
      end
    }
 
    use {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('trouble').setup {
        }
      end
    }

    use 'MunifTanjim/exrc.nvim'                       -- per project config

    use 'MattesGroeger/vim-bookmarks'                 -- bookmarks 
    use 'tom-anders/telescope-vim-bookmarks.nvim'

    use {                                             -- suggest keys
      'folke/which-key.nvim',
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
        }
      end
    }

    use 'duane9/nvim-rg'                              -- ripgrep

    use "petertriho/nvim-scrollbar"

    use "chrisbra/csv.vim"                            -- csv support

    use {                                             -- debugger support
      'mfussenegger/nvim-dap',
      requires = {
        'theHamsta/nvim-dap-virtual-text',
        'nvim-telescope/telescope-dap.nvim'
      }
    }

    -- Improve LSP 
    use ({
      'nvimdev/lspsaga.nvim',
      after = 'nvim-lspconfig',
      config = function()
        require('lspsaga').setup({
          ui = {
            code_action = '💡'
          }
        })
      end,
    })

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
