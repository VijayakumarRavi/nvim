local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > -1 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile && PackerSync
  augroup end
]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'airblade/vim-rooter'}                                   -- Changes the working directory to the project root when you open a file or directory.
  use {'joshdick/onedark.vim'}                                  -- A dark Vim/Neovim color scheme.
  use {'lewis6991/gitsigns.nvim'}                               -- Git decorations implemented purely in lua/teal.
  use {'lukas-reineke/indent-blankline.nvim'}                   -- This plugin adds indentation guides to all lines (including empty lines).

--  use {'ojroques/nvim-bufbar'}                                  -- A simple and very light bufferline for Neovim written in Lua.
  use {'ojroques/nvim-bufdel'}                                  -- A very small Neovim plugin to improve the deletion of buffers.
  use {'ojroques/nvim-buildme'}                                 -- A Neovim plugin to build or run a project using the built-in terminal.
  use {'ojroques/nvim-hardline'}                                -- A statusline / bufferline for Neovim written in Lua.
  use {'ojroques/vim-oscyank'}                                  -- A Vim / Neovim plugin to copy text to the system clipboard from anywhere using the ANSI OSC52 sequence.
  use {'ojroques/nvim-lspfuzzy'}
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use {'tpope/vim-fugitive'}                                    -- A Git wrapper.
  use {'tpope/vim-unimpaired'}                                  -- This plugin provides several pairs of bracket maps. Reff -- https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt
  use {'nvim-telescope/telescope.nvim'}                         -- Its a highly extendable fuzzy finder over lists.
  use {'nvim-lua/plenary.nvim'}                                 -- A Lua module for asynchronous programming using coroutines {Telescope dependency}.
  use {'kyazdani42/nvim-web-devicons'}                          -- Icons for Telescope.
  use {'junegunn/fzf'}                                          -- Fzf is a general-purpose command-line fuzzy finder.
  use {'junegunn/fzf.vim'}                                      -- Fzf vim version.
  use {'justinmk/vim-dirvish'}                                  -- Path navigator designed to work with Vim's built-in mechanisms and complementary plugins.
  use {'christoomey/vim-tmux-navigator'}                        -- For Tmux pane switching.
  use {'kyazdani42/nvim-tree.lua',  requires = 'kyazdani42/nvim-web-devicons' }

  use {'neovim/nvim-lspconfig'}                                 -- Lsp Client for nvim.
  use {'kabouzeid/nvim-lspinstall'}                             -- Automatic lsp Install.
  use {'nvim-treesitter/nvim-treesitter'} --, run = ':TSUpdate'}    -- Tree-sitter is a parser generator tool and an incremental parsing library.
  use {'nvim-treesitter/nvim-treesitter-textobjects'}           -- Create your own textobjects using tree-sitter queries.
  use {'hrsh7th/nvim-compe'}                                    -- Auto completion plugin for nvim.
  -- Install nvim-cmp, and buffer source as a dependency
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/vim-vsnip', 'hrsh7th/cmp-buffer', }}
  use { 'Krasjet/auto.pairs' }
  use { 'glepnir/dashboard-nvim', require = 'modules.config.dashboard-nvim',  }
  use {'dracula/vim', as = 'dracula'}


  require('packer').install()
  require('packer').compile()
end)

