local fn = vim.fn

-- Install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false) -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function()
    use "wbthomason/packer.nvim" -- Packer can manage itself
    use 'Rigellute/rigel' -- Theme
    use 'yuezk/vim-js'
    use 'HerringtonDarkholme/yats.vim'
    use 'maxmellon/vim-jsx-pretty'
    use 'jparise/vim-graphql'
    use {
        'styled-components/vim-styled-components',
        branch = 'main'
    }
    use 'elixir-editors/vim-elixir'
    use 'slashmili/alchemist.vim'
    use 'mhinz/vim-mix-format'
    use 'vim-ruby/vim-ruby'
    use 'rust-lang/rust.vim'
    use 'toyamarinyon/vim-swift'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'ojroques/nvim-lspfuzzy',
        requires = {{'junegunn/fzf'}, {'junegunn/fzf.vim'}},
        config = "require('lspfuzzy').setup{}"
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = "require('hop').setup{}"
    }
    use {
        "blackCauldron7/surround.nvim",
        config = "require('surround').setup{}"

    }
    use 'rmagatti/auto-session'
    use 'rmagatti/session-lens'
    use 'airblade/vim-gitgutter'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use {
        "onsails/lspkind-nvim",
        config = "require('lspkind').init({})"
    }
    use {
        "glepnir/lspsaga.nvim",
        config = "require('lspsaga').init_lsp_saga()"
    }
    use "hrsh7th/nvim-compe"
    use "mhartington/formatter.nvim"
    use "windwp/nvim-ts-autotag"
    use 'akinsho/nvim-toggleterm.lua'
    use 'b3nj5m1n/kommentary'
    use 'junegunn/goyo.vim'
    use {
        'windwp/nvim-autopairs',
        config = "require('nvim-autopairs').setup{}"
    }
    use {
        'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'karb94/neoscroll.nvim',
        config = "require('neoscroll').setup()"
    }
end)
