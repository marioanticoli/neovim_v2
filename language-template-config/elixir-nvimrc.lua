require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "eex",
    "elixir",
    "erlang",
    "heex",
    "html"
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

-- Elixir LSP 
require('lspconfig')['elixirls'].setup {
  capabilities = capabilities,
  cmd = { "/home/mario/.nix-profile/lib/language_server.sh" },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

