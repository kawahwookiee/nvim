--[[ vars.lua ]]

local g = vim.g
g.t_co = 256
g.background = "dark"

-- [[ C++ ]]
g.cpp_attributes_highlight = 1
g.cpp_member_highlight = 1
g.cpp_named_requirements_highlight = 1

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path
