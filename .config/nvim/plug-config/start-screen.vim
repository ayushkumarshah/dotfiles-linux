let g:startify_custom_header = [                
      \'         d8888                            888     d8b              888     888 8888888 888b     d888', 
      \'        d88888                            888     88P              888     888   888   8888b   d8888', 
      \'       d88P888                            888     8P               888     888   888   88888b.d88888',
      \'      d88P 888 888  888 888  888 .d8888b  88888b. "  .d8888b       Y88b   d88P   888   888Y88888P888', 
      \'     d88P  888 888  888 888  888 88K      888 "88b   88K            Y88b d88P    888   888 Y888P 888', 
      \'    d88P   888 888  888 888  888 "Y8888b. 888  888   "Y8888b.        Y88o88P     888   888  Y8P  888', 
      \'   d8888888888 Y88b 888 Y88b 888      X88 888  888        X88         Y888P      888   888   "   888', 
      \'  d88P     888  "Y88888  "Y88888  88888P" 888  888    88888P"          Y8P     8888888 888       888', 
      \'                    888                                                                              ',
      \'               Y8b d88P                                                                              ',
      \'                "Y88P"                                                                               ',
      \]

let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'files',     'header': ['   Recent Files']                 },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

" let g:webdevicons_enable_startify = 1

" function! StartifyEntryFormat()
"         return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
"     endfunction

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ {'b': '~/Desktop/Blog_writing/ayushkumarshah.github.io'},
            \ {'d': '~/Desktop/dotfiles-mac'},
            \ {'n': '~/Desktop/notes/wiki/index.md'},
            \ {'c': '~/Desktop/Blog_writing/ayushkumarshah.github.io/_posts/2020-08-12-common-commands.md'},
            \ ]

let g:startify_enable_special = 0
