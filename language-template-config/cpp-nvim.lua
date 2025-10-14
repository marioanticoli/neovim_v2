-- Remember to link with name .nvim.lua

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "cpp",
    "arduino"
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

-- CPP LSP 
lsp.config('clangd', {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
})
