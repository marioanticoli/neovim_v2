--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Toggle nvim-tree
map('n', 'feo', [[:NvimTreeToggle<cr>]], {})

map('n', 'l', [[:IndentLinesToggle<cr>]], {})
map('n', 't', [[:TagbarToggle<cr>]], {})

-- Save buffer
map('n', '<c-s>', ':w<CR>', {})
map('i', '<c-s>', '<Esc>:w<cr>', {})

-- Navigation
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-l>', '<c-w>l', opts)

-- LSP 
map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
map('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
map('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
map('n', 'gb', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
map('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
map('n', 'gr', ':lua vim.lsp.buf.references()<cr>', opts)
map('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', opts)
map('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)
map('n', '<space>e', '<cmd> lua vim.diagnostic.open_float()<cr>', opts)
map('n', '<c-a>', ':CodeActionMenu<cr>', opts)

-- Telescope 
map('n', 'fg', ':Telescope live_grep<cr>', opts)
map('n', 'fb', ':Telescope buffers<cr>', opts)
map('n', 'fh', ':Telescope help_tags<cr>', opts)
map('n', '<c-p>', ':Telescope find_files<cr>', opts)

-- BarBar
map('n', '<S-h>', ':BufferPrevious<cr>', opts)
map('n', '<S-l>', ':BufferNext<cr>', opts)
map('n', '<S-tab>', ':BufferPick<cr>', opts)
map('n', '<c-w>', ':BufferClose<cr>', opts)
map('n', '<S-c-w>', ':BufferCloseAllButCurrentOrPinned<cr>', opts)

