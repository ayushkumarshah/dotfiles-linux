require('meta.metamate').init({

        -- // change the keymap used for accepting completion. defaults to <C-l>
        -- completionKeymap='<C-m>', 
        
        -- // change the highlight group used for showing the completion. defaults to Delimiter
        -- virtualTextHighlightGroup='ErrorMsg',
        
        -- // change the languages to target. defaults to php, python, rust
        -- filetypes = {"php", "python"} 
        
})

-- require('meta.metamate').init({
--   completionKeymap = nil
-- })

-- require('cmp').setup {
--   mapping = {
--     ['<CR>'] = function(fallback)
--       if require('meta.metamate').is_visible() then
--         require('meta.metamate').accept() --// accept if available
--       elseif require('cmp').visible() then
--         require('cmp').confirm() --// fallsback to cmp completion
--       else
--         fallback() --// fallsback to enter otherwise
--       end
--     end,
--     ['<C-e>'] = function(fallback)
--       if require('meta.metamate').is_visible() then
--         require('meta.metamate').accept_word() --// accepts only the first word from the completion
--       else
--         fallback()
--       end
--     end,
--     ['<esc>'] = function(fallback)
--       if require('meta.metamate').is_visible() then
--         require('meta.metamate').dismiss()
--       else
--         fallback()
--       end
--     end
--   }
-- }

return {}


