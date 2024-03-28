-- [[ plug.lua ]]

require("lazy").setup({
	{'mhinz/vim-startify', enabled = true},
	{'kyazdani42/nvim-tree.lua', enabled = true},
	{'DanilaMihailov/beacon.nvim', enabled = true},                         -- cursor jump
	{'nvim-lualine/lualine.nvim', enabled = true},                          -- statusline
	{'navarasu/onedark.nvim', enabled = true},                              -- onedark theme
	{'nvim-telescope/telescope.nvim', enabled = true},                      -- fuzzy finder
	{'nvim-telescope/telescope-fzf-native.nvim', enabled = true},           -- fuzzy finder engine
        --run = 'make' }
	{'Yggdroot/indentLine', enabled = true},                                -- see indentation
	{'tpope/vim-fugitive', enabled = true},                                 -- git integration
	{'windwp/nvim-autopairs', enabled = true},
	{'lewis6991/impatient.nvim', enabled = true},                           -- speed up boot time
	{'preservim/nerdcommenter', enabled = true},                            -- commenting
	{'romgrk/barbar.nvim', enabled = true},                                 -- tabline
	{'nvim-treesitter/nvim-treesitter', enabled = true},                   -- parser tool
    -- maybe delete???
	{'nvim-treesitter/nvim-treesitter-refactor', enabled = true},           -- refactor for treesitter
	{'neovim/nvim-lspconfig', enabled = true},                              -- lsp client config 
	{'williamboman/mason.nvim', enabled = true},                            -- package manager for lsp
    -- LSP plugins
	{'hrsh7th/nvim-cmp', enabled = true},
	{'hrsh7th/cmp-nvim-lsp', enabled = true},
	{'hrsh7th/cmp-nvim-lsp-signature-help', enabled = true},

	{'hrsh7th/cmp-buffer', enabled = true},
	{'hrsh7th/cmp-path', enabled = true},
	{'hrsh7th/cmp-cmdline', enabled = true},
	{'L3MON4D3/LuaSnip', enabled = true},
	{'rafamadriz/friendly-snippets', enabled = true},
	{'benfowler/telescope-luasnip.nvim', enabled = true},
	{'lukas-reineke/indent-blankline.nvim', enabled = true},
	{'nvim-lua/plenary.nvim', enabled = true},
	{'f-person/git-blame.nvim', enabled = true},
	{'lewis6991/gitsigns.nvim', enabled = true},
      --config = function()
        --require('gitsigns').setup()
        --require("scrollbar.handlers.gitsigns").setup()
      --end
 
	{'MunifTanjim/exrc.nvim', enabled = true},                              -- per project config
	{'MattesGroeger/vim-bookmarks', enabled = true},                        -- bookmarks 
	{'tom-anders/telescope-vim-bookmarks.nvim', enabled = true},
	{'folke/which-key.nvim', enabled = true},
      --config = function()
        --vim.o.timeout = true
        --vim.o.timeoutlen = 300
        --require("which-key").setup {
        --}
      --end
	{'duane9/nvim-rg', enabled = true},                                     -- ripgrep
	{'petertriho/nvim-scrollbar', enabled = true},
	{'mfussenegger/nvim-dap', enabled = true},
    -- Improve LSP 
	{'nvimdev/lspsaga.nvim', enabled = true},
      --after = 'nvim-lspconfig', enabled = true},
      --config = function()
        --require('lspsaga').setup({
          --ui = {
            --code_action = '💡'
          --}
        --})
      --end,
    --})
	{'Exafunction/codeium.nvim', enabled = true},
      --config = function()
        --require("codeium").setup({
          --enable_chat = true
        --})
      --end
    --}
})
