-- [[ plug.lua ]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('config')..'/site/pack/packer/start/packer.nvim'
  print(install_path)
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

return require('packer').startup(function(use)
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'dracula/vim', as = 'dracula' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'preservim/tagbar' }
  use { 'tpope/vim-fugitive' }
  use { 'airblade/vim-gitgutter' }
  use { 'junegunn/fzf' }
  use { 'junegunn/fzf.vim' }
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'cappyzawa/trim.nvim' }
  use { 'bfrg/vim-cpp-modern' }
  use { 'terrortylor/nvim-comment' }
  use { 'RRethy/vim-illuminate' }
  use { 'simrat39/rust-tools.nvim' }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
