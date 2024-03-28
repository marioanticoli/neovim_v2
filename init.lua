--[[ init.lua ]]


-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps

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
    config = function() 
      require("nvim-tree").setup({
        on_attach = on_attach,
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
    end
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
    }
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
	--{
    --'nvim-telescope/telescope.nvim',
    --dependencies = { 
      --{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      --'nvim-lua/plenary.nvim' 
    --},
    --config = function()
      ----require('telescope').load_extension('fzf', 'ui-select', 'live_grep_args')
      --require("telescope").load_extension { 
        --{ "nvim-telescope/fzf.lua" },  -- fzf extension
        --{ "nvim-telescope/ui-select.lua" },  -- ui-select extension
        --{ "nvim-telescope/live_grep_args.lua" },  -- live_grep_args extension
      --}
    --end
  --},
	{ 'lukas-reineke/indent-blankline.nvim' },
	{ 'tpope/vim-fugitive' },
	{ 'f-person/git-blame.nvim' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  { 'preservim/nerdcommenter' },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
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
          [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ' }
        },
        preset = 'powerline',
      }
    }
  },
	{ 'petertriho/nvim-scrollbar' },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require'nvim-treesitter.configs'.setup {
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
      }
    end,
    -- Optional: Add event key for lazy-loading on specific event
    -- event = "BufEnter",
  },
	{ 'nvim-treesitter/nvim-treesitter-refactor' },
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
	{ 'MattesGroeger/vim-bookmarks' },                        -- bookmarks 
	{ 'tom-anders/telescope-vim-bookmarks.nvim' },
	{ 'mfussenegger/nvim-dap' },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = true,
    opts = {
      enable_chat = true
    }
    --config = function()
      --require("codeium").setup({
        --enable_chat = true
      --})
    --end
  },
  {
    'neovim/nvim-lspconfig',
    config = true
  },
	--{ 'nvimdev/lspsaga.nvim' },
	--{ 'hrsh7th/nvim-cmp' },
	--{ 'hrsh7th/cmp-nvim-lsp' },
	--{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
	--{ 'hrsh7th/cmp-buffer' },
	--{ 'hrsh7th/cmp-path' },
	--{ 'hrsh7th/cmp-cmdline' },
})

--vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  --vim.lsp.handlers.hover, {
    ---- Use a sharp border with `FloatBorder` highlights
    --border = "single"
  --}
--)

--vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  --vim.lsp.handlers.signature_help, {
    ---- Use a sharp border with `FloatBorder` highlights
    --border = "single"
  --}
--)
---- Load the lspconfig module
--lspconfig = require('lspconfig')

--lspconfig.tsserver.setup {}

---- Autocompletion settings
--local cmp = require'cmp'
--cmp.setup({
  --snippet = {
    --expand = function(args)
      --require('luasnip').lsp_expand(args.body)
    --end,
  --},
  --mapping = cmp.mapping.preset.insert({
    --['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --['<C-f>'] = cmp.mapping.scroll_docs(4),
    --['<C-Space>'] = cmp.mapping.complete(),
    --['<C-e>'] = cmp.mapping.abort(),
    --['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --}),
  --sources = cmp.config.sources({
    --{ name = 'nvim_lsp' },
    --{ name = "luasnip" },
    --{ name = "buffer" },
    --{ name = "path" },
    --{ name = 'nvim_lsp_signature_help' },
    --{ name = "codeium" }
  --})
--})

---- Setup lspconfig.
--local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

--require('lualine').setup {
--}

-- nvim-tree mappings
local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  --vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  --vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
  --vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  --vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
  --vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  --vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  --vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  --vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
  --vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  --vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  --vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
  --vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  --vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  --vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
  --vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
  --vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
  vim.keymap.set('n', 'D',     api.fs.remove,                         opts('Delete'))
  vim.keymap.set('n', 'd',     api.fs.trash,                          opts('Trash'))
  --vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
  --vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  --vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
  --vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
  --vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
  --vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
  --vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  --vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  --vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
  --vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
  --vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
  --vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
  --vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
  --vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'Y',     api.fs.copy.filename,                  opts('Copy Name'))
  vim.keymap.set('n', 'y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
  --vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  --vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH

  -- Mappings removed via:
  --   remove_keymaps
  --   OR
  --   view.mappings.list..action = ""
  --
  -- The dummy set before del is done for safety, in case a default mapping does not exist.
  --
  -- You might tidy things by removing these along with their default mapping.
  vim.keymap.set('n', 'f', '', { buffer = bufnr })
  vim.keymap.del('n', 'f', { buffer = bufnr })

  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
end

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


