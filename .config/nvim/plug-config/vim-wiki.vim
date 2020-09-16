  let g:vimwiki_key_mappings =
    \ {
    \   'all_maps': 1,
    \   'global': 1,
    \   'headers': 1,
    \   'text_objs': 1,
    \   'table_format': 1,
    \   'table_mappings': 1,
    \   'lists': 1,
    \   'links': 1,
    \   'html': 1,
    \   'mouse': 1,
    \ }

nmap <Leader><Tab> <Plug>VimwikiNextLink
nmap <Leader><S-Tab> <Plug>VimwikiPrevLink

" Filetypes enabled for
" let g:vimwiki_filetypes = ['markdown']

let g:vimwiki_list = [{'path': '~/Desktop/notes/wiki'}]


