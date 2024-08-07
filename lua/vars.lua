--[[ vars.lua ]]

local g = vim.g
g.t_co = 256
g.background = "dark"

-- Disable netrw in favour of nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
g.mapleader = ";"
g.localleader = "\\"

-- Set slime to target tmux
g.slime_target = "tmux"
g.slime_default_config = { socket_name = "default", target_pane = "main:1.0" }

