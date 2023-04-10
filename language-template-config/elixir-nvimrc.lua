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

-- Elixir LSP 
require('lspconfig')['elixirls'].setup {
  capabilities = capabilities,
  cmd = { "/home/mario/.local/share/nvim/mason/bin/elixir-ls" },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

--require'lspconfig'.tsserver.setup {}

vim.api.nvim_set_keymap('n', '<leader>f', ':w <bar> !mix format %<CR>', {noremap=true, silent=true})

--vim.api.nvim_create_autocmd(
    --{ "BufWritePost" },
    --{ pattern = { "*.ex", "*.exs" }, command = "!mix format %" }
--)
