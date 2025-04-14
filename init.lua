--[[ init.lua ]]

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('functions')

-- Auto setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins 
require("lazy").setup({
	{ 'mhinz/vim-startify' },
	{
    'kyazdani42/nvim-tree.lua',
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local function on_attach_change(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return {
            desc = 'nvim-tree: ' .. desc, 
            buffer = bufnr, 
            noremap = true, 
            silent = true, 
            nowait = true 
          }
        end

        local function open_with_system_default()
          local node = api.tree.get_node_under_cursor()
          local filepath = node.absolute_path
          vim.cmd('silent !xdg-open ' .. filepath .. ' &')
        end

        --api.config.mappings.default_on_attach(bufnr)

        -- BEGIN_DEFAULT_ON_ATTACH
        vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
        vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
        vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
        vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
        vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
        vim.keymap.set('n', 'D',     api.fs.remove,                         opts('Delete'))
        vim.keymap.set('n', 'd',     api.fs.trash,                          opts('Trash'))
        vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
        vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
        vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
        vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
        vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
        vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
        vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
        vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
        vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
        vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
        vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
        vim.keymap.set('n', 'Y',     api.fs.copy.filename,                  opts('Copy Name'))
        vim.keymap.set('n', 'y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
        -- END_DEFAULT_ON_ATTACH

        vim.keymap.set('n', 'f', '', { buffer = bufnr })
        vim.keymap.del('n', 'f', { buffer = bufnr })

        vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', 'O', open_with_system_default, opts('Open with default application'))
      end

      require("nvim-tree").setup({
        on_attach = on_attach_change,
        view = {
          number = true,
          relativenumber = true,
        },
        update_focused_file = {
          enable = true,
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },
	{ 'DanilaMihailov/beacon.nvim' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true,
    opts =  {
      sections = {
        lualine_a = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        }
      }
    },
    event = 'BufEnter'
  },
	{
    'navarasu/onedark.nvim',
    config = function()
      --require("onedark").setup({
        --style = "darker",  -- Adjust style as desired
      --})
      require("onedark").load()
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-lua/plenary.nvim',
      'jonarrien/telescope-cmdline.nvim',
    },
    keys = {
      { '<leader><leader>', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' }
    },
    config = true,
    opts = {
      extensions_list = {'fzf', 'ui-select', 'live_grep_args', 'cmdline'}
    }
  },
  { 
    "lukas-reineke/indent-blankline.nvim", 
    event = "BufEnter",
    main = "ibl",
    opts = {} 
  },
  { 'tpope/vim-fugitive' },
	{ 'petertriho/nvim-scrollbar', config = true },
  { 
    'lewis6991/gitsigns.nvim',
     event = "BufEnter",
     config = function()
      require('gitsigns').setup()
      require("scrollbar.handlers.gitsigns").setup()
    end
  },
  {
    'f-person/git-blame.nvim',
    event = 'BufEnter',
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  { 
    'preservim/nerdcommenter',
    event = 'InsertEnter'
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
      highlight_inactive_file_icons = false,
      icons = {
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = {enabled = true, icon = '⚠️' }
        },
        preset = 'powerline',
      }
    },
    event = 'BufEnter'
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = true,
    opts = {
      ensure_installed = {
        "javascript",
        "json",
        "yaml"
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      refactor = {
        highlight_definitions = {
          enable = true,
          clear_on_cursor_move = true,
        }
      }
    },
    -- Optional: Add event key for lazy-loading on specific event
    event = "BufEnter",
  },
	{ 
    'nvim-treesitter/nvim-treesitter-refactor',
    event = 'BufEnter',
  },
	{ 'williamboman/mason.nvim', config = true },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 200
    end,
    opts = {}
  },
	{ 'duane9/nvim-rg' },                                     -- ripgrep
	{ 
    'MattesGroeger/vim-bookmarks', 
    event = 'BufEnter'
  },                        -- bookmarks 
	{ 'tom-anders/telescope-vim-bookmarks.nvim' },
	{ 
    'mfussenegger/nvim-dap', 
    lazy = true
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    lazy = true,
    config = true,
    opts = {
      enable_chat = true
    }
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup()
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  { 'neovim/nvim-lspconfig' },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },
  { 'L3MON4D3/LuaSnip' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    }
  },
  { 
    'jpalardy/vim-slime', 
    event = 'BufEnter'
  },
  {
  "ribelo/taskwarrior.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
})

-- LSP
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single"
  }
)

-- Load the lspconfig module
lspconfig = require('lspconfig')

lspconfig.ts_ls.setup {}

-- Autocompletion settings
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = "buffer" },
    { name = "path" },
    { name = 'nvim_lsp_signature_help' },
    { name = "luasnip" },
    { name = "copilot", group_index = 2 },
    { name = "codeium" }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

