" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Repeat stuff
    Plug 'tpope/vim-repeat'
    " Surround
    Plug 'tpope/vim-surround'
    " Better Comments
    Plug 'tpope/vim-commentary'
    " Have the file system follow you around
    Plug 'airblade/vim-rooter'
    " auto set indent settings
    " Plug 'tpope/vim-sleuth'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    " Plug 'scrooloose/NERDTree'
    " Highlighting for f/F , t/T
    Plug 'unblevable/quick-scope'

    " Colorizer for css
    Plug 'norcalli/nvim-colorizer.lua'
    " Add color for paranthesis
    Plug 'luochen1990/rainbow'
  " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Cool icons for explorer
    Plug 'ryanoasis/vim-devicons'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Closetags for HTML
    " Plug 'alvan/vim-closetag'
  " Themes
    Plug 'joshdick/onedark.vim'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Git Plugins
    " Show differences with style
    Plug 'mhinz/vim-signify'
    " Main GIT PLugin :Git
    Plug 'tpope/vim-fugitive'
    " Git Hub plugin, enables :Gbrowse
    Plug 'tpope/vim-rhubarb'
    " Git commit browser
    Plug 'junegunn/gv.vim'
    " Git commit history in each line
    Plug 'APZelos/blamer.nvim'
   " Terminal
    Plug 'voldikss/vim-floaterm'
   " Start Screen
    Plug 'mhinz/vim-startify'
    " Vista
    " Plug 'liuchengxu/vista.vim'
    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
    " Zen mode
    " Plug 'junegunn/goyo.vim'
    " Snippets
    Plug 'honza/vim-snippets'
    " Plug 'mattn/emmet-vim'
    " Interactive code
    Plug 'metakirby5/codi.vim'
    " Debugging
    " Plug 'puremourning/vimspector'
    " Better tabline
    " Plug 'mg979/vim-xtabline'
    " undo and redo using visaulization
    Plug 'mbbill/undotree'
    " highlight all matches under cursor
    Plug 'RRethy/vim-illuminate'
    " Find and replace across projects easily
    Plug 'ChristianChiarulli/far.vim'
    " Plug 'brooth/far.vim'
    " Auto change html tags
    " Plug 'AndrewRadev/tagalong.vim'
    " live server for html, css, js
    " Plug 'turbio/bracey.vim'
    " Smooth scroll
    Plug 'psliwka/vim-smoothie'
    " async tasks
    " Plug 'skywind3000/asynctasks.vim'
    " Plug 'skywind3000/asyncrun.vim'
    " Swap windows
    " Plug 'wesQ3/vim-windowswap'
    " Markdown preview in browser
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
    Plug 'iamcco/mathjax-support-for-mkdp'
    " Easily Create Gists
    " Plug 'mattn/vim-gist'
    " Plug 'mattn/webapi-vim'
    " Async Linting Engine
    " TODO make sure to add ale config before plugin
    " Plug 'dense-analysis/ale'
    " Better Whitespace
    Plug 'ntpeters/vim-better-whitespace'
    " Multiple Cursors
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'moll/vim-bbye'
    " Ranger in vim
    " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    Plug 'francoiscabrol/ranger.vim'
    " Dependency for ranger in neovim
    Plug 'rbgrouleff/bclose.vim'
    " Delete buffer using bd
    " Plug 'rbgrouleff/bclose.vim'
    " Plug 'vimwiki/vimwiki'
    Plug 'voldikss/vim-floaterm'
    " Alternative to vimwiki
    " Plug 'fcpg/vim-waikiki'
    " Plug 'zxqfl/tabnine-vim'
    " Bullets for markdown
    Plug 'dkarter/bullets.vim'
    Plug 'justinmk/vim-sneak' 
    " Highlight csv / tsv columns in sifferent colours.
    " Plug 'mechatroner/rainbow_csv'
    " Native LSP
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'hrsh7th/nvim-compe'
    " Plug 'kabouzeid/nvim-lspinstall'

    " Vim Snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
