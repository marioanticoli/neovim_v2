-- Remember to link with name .nvim.lua

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "eex",
    "elixir",
    "erlang",
    "heex",
    "surface",
    "html",
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

-- Debugger 
require('dap').configurations.elixir = {
  {
    type = 'mix_task',
    request = 'launch',
    name = 'Debug',
    task = 'test',
    args = { '--trace' },
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    stopOnEntry = false,
  },
}

-- Set up Elixir LSP
lsp.config('elixirls', {
  cmd = { "elixir-ls" },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities
})

lsp.enable('elixirls')

--lsp.config('lexical'), {
  --cmd = { "/home/mario/.local/share/nvim/mason/bin/expert" },
  --root_dir = function(fname)
    --return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
  --end,
  --filetypes = { "elixir", "eelixir", "heex" },
  ---- optional settings
  --settings = {}
--})

--lsp.config('nextls', {
  --cmd = {"nextls", "--stdio"},
  --init_options = {
    --extensions = {
      --credo = { enable = true }
    --},
    --experimental = {
      --completions = { enable = true }
    --}
  --}
--})

--lsp.config('lexical', {
  --cmd = { "/home/mario/.local/share/nvim/mason/bin/lexical" },
  --root_dir = function(fname)
    --return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
  --end,
  --filetypes = { "elixir", "eelixir", "heex" },
  ---- optional settings
  --settings = {}
--})

-- Set up Erlang LSP
lsp.config('erlangls', {
  cmd = { "/home/mario/.local/share/nvim/mason/bin/erlang_ls" },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
})

lsp.enable('erlangls')

vim.api.nvim_set_keymap('n', '<leader>f', ':w <bar> !mix format %<CR>', {noremap=true, silent=true})

--vim.api.nvim_create_autocmd(
    --{ "BufWritePost" },
    --{ pattern = { "*.ex", "*.exs" }, command = "!mix format %" }
--)
