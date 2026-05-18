-- Remember to link with name .nvim.lua

-- Install treesitter parsers for C/C++ development
require('nvim-treesitter').install({ "c", "cpp", "arduino" })

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
