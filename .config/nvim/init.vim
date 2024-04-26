" General Settings
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

" Themes
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/onedark.vim

" Plugin Configuration
source $HOME/.config/nvim/plug-config/better-whitespace.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/blamer.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/codi.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
" source $HOME/.config/nvim/plug-config/vim-wiki.vim
" source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
" source $HOME/.config/nvim/plug-config/floaterm.vim
" source $HOME/.config/nvim/plug-config/vista.vim
" source $HOME/.config/nvim/plug-config/xtabline.vim
source $HOME/.config/nvim/plug-config/polyglot.vim
source $HOME/.config/nvim/plug-config/far.vim
" source $HOME/.config/nvim/plug-config/tagalong.vim
source $HOME/.config/nvim/plug-config/illuminate.vim
" source $HOME/.config/nvim/plug-config/bracey.vim
" source $HOME/.config/nvim/plug-config/asynctask.vim
" source $HOME/.config/nvim/plug-config/window-swap.vim
source $HOME/.config/nvim/plug-config/markdown-preview.vim
" source $HOME/.config/nvim/plug-config/vimspector.vim " Uncomment if you want to use Vimspector
" source $HOME/.config/nvim/plug-config/ale.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/ranger.vim
" source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/nerd-commenter.vim
source $HOME/.config/nvim/plug-config/sneak.vim
source $HOME/.config/nvim/plug-config/ulti-snips.vim

luafile $HOME/.config/nvim/lua/plug-colorizer.lua
source $HOME/.config/nvim/plug-config/lsp-config.vim
" luafile $HOME/.config/nvim/lua/lsp/lspinstall.lua
" luafile $HOME/.config/nvim/lua/lsp/compe-config.lua
luafile $HOME/.config/nvim/lua/lsp/python-lsp.lua

source $HOME/.config/nvim/plug-config/vimtex.vim

" source $HOME/.config/nvim/plug-config/rainbow_parantheses.vim
" source $HOME/.config/nvim/plug-config/vim-wiki.vim
" source $HOME/.config/nvim/plug-config/waikiki.vim

" Add paths to node and python here
if !empty(glob("~/.config/nvim/paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif
