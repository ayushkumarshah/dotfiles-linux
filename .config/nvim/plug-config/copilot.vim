let g:copilot_filetypes = { 'xml': v:false }

imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
