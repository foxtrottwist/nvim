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
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Theme
    use 'Rigellute/rigel'

    -- Language support ~ Front-End
    use 'yuezk/vim-js'
    use 'HerringtonDarkholme/yats.vim'
    use 'maxmellon/vim-jsx-pretty'
    use 'jparise/vim-graphql'

    use {
        'styled-components/vim-styled-components',
        branch = 'main'
    }

    -- Language support ~ Elixir
    use 'elixir-editors/vim-elixir'
    use 'slashmili/alchemist.vim'
    use 'mhinz/vim-mix-format'

    -- Language support ~ Ruby
    use 'vim-ruby/vim-ruby'

    -- Language support ~ Rust
    use 'rust-lang/rust.vim'

    -- Language support ~ Swift
    use 'toyamarinyon/vim-swift'

    -- Navigation
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            require('telescope').setup {
                defaults = {
                    vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number',
                                         '--column', '--smart-case'},
                    prompt_prefix = " ",
                    selection_caret = " ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "descending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            mirror = false
                        },
                        vertical = {
                            mirror = false
                        }
                    },
                    file_sorter = require'telescope.sorters'.get_fuzzy_file,
                    file_ignore_patterns = {},
                    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
                    winblend = 0,
                    border = {},
                    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
                    color_devicons = true,
                    use_less = true,
                    path_display = {},
                    set_env = {
                        ['COLORTERM'] = 'truecolor'
                    }, -- default = nil,
                    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
                    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
                    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

                    -- Developer configurations: Not meant for general override
                    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
                }
            }
        end
    }

    use {
        'ojroques/nvim-lspfuzzy',
        requires = {{'junegunn/fzf'}, {'junegunn/fzf.vim'}},
        config = "require('lspfuzzy').setup {}"
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
        config = function()
            require('surround').setup {}
        end
    }

    -- Session Management
    use 'rmagatti/auto-session'
    use 'rmagatti/session-lens'

    -- Version Control
    use 'airblade/vim-gitgutter'

    -- Status bar
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    use "neovim/nvim-lspconfig"

    use {
        "onsails/lspkind-nvim",
        config = "require('lspkind').init({})"
    }

    use {
        "glepnir/lspsaga.nvim",
        config = "require('lspsaga').init_lsp_saga()"
    }

    use {
        "hrsh7th/nvim-compe",
        config = function()
            require('compe').setup {
                source = {
                    path = true,
                    nvim_lsp = true,
                    luasnip = true,
                    buffer = false,
                    calc = false,
                    nvim_lua = false,
                    vsnip = false,
                    ultisnips = false
                }
            }
        end
    }

    use {
        "mhartington/formatter.nvim",
        config = function()
            -- Prettier function for formatter
            local prettier = function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end

            require("formatter").setup({
                logging = false,
                filetype = {
                    javascript = {prettier},
                    typescript = {prettier},
                    javascriptreact = {prettier},
                    typescriptreact = {prettier},
                    html = {prettier},
                    css = {prettier},
                    scss = {prettier},
                    markdown = {prettier}
                }
            })
        end
    }

    use "windwp/nvim-ts-autotag"

    -- Tabs, as understood by any other editor.
    use {
        'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Terminal Integration
    use {
        'akinsho/nvim-toggleterm.lua',
        config = function()
            require('toggleterm').setup {
                size = 20,
                open_mapping = [[<C-j>]],
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = '1',
                start_in_insert = true,
                persist_size = true,
                direction = 'horizontal'
            }
        end
    }

    -- Smooth scrolling
    use {
        'karb94/neoscroll.nvim',
        config = "require('neoscroll').setup()"
    }

    -- Comment out line(s)
    use 'b3nj5m1n/kommentary'

    -- Distraction-free writing mode
    use 'junegunn/goyo.vim'

end)
