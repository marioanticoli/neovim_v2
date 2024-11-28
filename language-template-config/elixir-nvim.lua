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
lspconfig.elixirls.setup {
  --cmd = { "/home/mario/.local/share/nvim/mason/bin/elixir-ls" },
  cmd = { "/home/mario/.local/share/nvim/mason/bin/lexical" },
  --cmd = { "/home/mario/.local/share/nvim/mason/bin/nextls" },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- Set up Erlang LSP
lspconfig.erlangls.setup {
  cmd = { "/home/mario/.local/share/nvim/mason/bin/erlang_ls" },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

vim.api.nvim_set_keymap('n', '<leader>f', ':w <bar> !mix format %<CR>', {noremap=true, silent=true})

--vim.api.nvim_create_autocmd(
    --{ "BufWritePost" },
    --{ pattern = { "*.ex", "*.exs" }, command = "!mix format %" }
--)
