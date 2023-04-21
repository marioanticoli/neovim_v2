--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Toggle nvim-tree
map('n', 'feo', [[:NvimTreeToggle<cr>]], {})

map('n', '<leader>l', [[:IndentLinesToggle<cr>]], {})

-- Save buffer
map('n', '<c-s>', ':w<CR>', {})
map('i', '<c-s>', '<Esc>:w<cr>', {})

-- Copy to system clipboard
map('v', '<leader>y', '"*y :let @+=@*<CR>', {noremap=true, silent=true})
map('n', '<leader>Y', '"*Y :let @+=@*<CR>', {noremap=true, silent=true})
map('n', '<leader>p', '"+p', {noremap=true, silent=true})
map('v', '<leader>x', '"*x :let @+=@*<CR>', {noremap=true, silent=true})

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
map('n', 'fg', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>', opts)
map('n', 'fb', ':Telescope buffers<cr>', opts)
map('n', 'fh', ':Telescope help_tags<cr>', opts)
map('n', '<c-p>', ':Telescope find_files<cr>', opts)
map('n', 'ms', ':Telescope vim_bookmarks<cr>', opts)

-- BarBar
map('n', '<S-h>', ':BufferPrevious<cr>', opts)
map('n', '<S-l>', ':BufferNext<cr>', opts)
map('n', '<S-tab>', ':BufferPick<cr>', opts)
map('n', '<c-w>', ':BufferClose<cr>', opts)
map('n', '<S-c-w>', ':BufferCloseAllButCurrentOrPinned<cr>', opts)

-- Trouble
local trouble_opts = {silent = true, noremap = true}
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", trouble_opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", trouble_opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", trouble_opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", trouble_opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", trouble_opts)
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", trouble_opts)

-- FTerm
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)

-- GitSigns
map('n', '<leader>hp', ':Gitsigns preview_hunk_inline<CR>', opts)
map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
map('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>', opts)
