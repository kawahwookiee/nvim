-- [[ plug.lua ]]

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
end)
