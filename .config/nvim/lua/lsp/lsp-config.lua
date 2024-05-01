require'lspconfig'.pyright.setup{
  on_attach = function(client, bufnr)
			local opts = {noremap = true, silent = true}
			local keymap = vim.api.nvim_buf_set_keymap
			keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
			keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
			keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
			keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  end
}

-------------------------------------------
-- Version 3
-- require'lspconfig'.pyright.setup{
--   on_attach = function(client, bufnr)
--     local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--     local opts = { noremap=true, silent=true }

--     -- Mapping for Go to definition
--     buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
-- 		buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- 		buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   end
-- }

-------------------------------------------
-- -- Version 1
-- -- Importing the lspconfig module
-- local lspconfig = require('lspconfig')

-- -- local map = function(type, key, value)
-- -- 	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
-- -- end

-- -- Function for mapping keys in the LSP context
-- local function map(type, key, value)
--     vim.api.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true })
-- end


-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local opts = { noremap=true, silent=true }

--   -- Mappings.
--   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
--   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- end

-- require'lspconfig'.pyright.setup{
--   on_attach = on_attach
-- }

-- -- Custom attachment function to add when LSP starts
-- local function custom_attach(client)
--     print("LSP started.")
--     require'completion'.on_attach(client)
--     require'diagnostic'.on_attach(client)

--     map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
--     map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
--     map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- 		map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
-- 		map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
-- 		map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
-- 		map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- 		-- map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
-- 		-- map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
-- 		-- map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
-- 		-- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
-- 		-- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
-- 		-- map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
-- 		-- map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
-- 		-- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
-- 		-- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
-- end

-- -- vim.lsp.tsserver.setup{on_attach=custom_attach}
-- -- vim.lsp.clangd.setup{on_attach=custom_attach}
-- -- vim.lsp.sumneko_lua.setup{
-- -- 	on_attach=custom_attach,
-- -- 	settings = {
-- -- 		Lua = {
-- -- 			runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
-- -- 			completion = { keywordSnippet = "Disable", },
-- -- 			diagnostics = { enable = true, globals = {
-- -- 				"vim", "describe", "it", "before_each", "after_each" },
-- -- 			},
-- -- 			workspace = {
-- -- 				library = {
-- -- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- -- 					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
-- -- 				}
-- -- 			}
-- -- 		}
-- -- 	}
-- -- }

-- -- Setup for different language servers
-- lspconfig.tsserver.setup{ on_attach = custom_attach }
-- lspconfig.clangd.setup{ on_attach = custom_attach }
-- lspconfig.lua_ls.setup{
--     on_attach = custom_attach,
--     settings = {
--         Lua = {
--             runtime = { version = "LuaJIT", path = vim.split(package.path, ';') },
--             completion = { keywordSnippet = "Disable" },
--             diagnostics = { enable = true, globals = {"vim", "describe", "it", "before_each", "after_each"} },
--             workspace = {
--                 library = {
--                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                     [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
--                 }
--             }
--         }
--     }
-- }

-- -- Uncomment to execute the extension test mentioned above.
-- -- local function custom_codeAction_callback(_, _, action)
-- -- 	print(vim.inspect(action))
-- -- end

-- -- vim.lsp.callbacks['textDocument/codeAction'] = custom_codeAction_callback

-- vim.lsp.handlers['textDocument/codeAction'] = function(err, result, ctx, config)
--     print(vim.inspect(result))
-- end

-- Old version2
-------------------------------------------
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local opts = { noremap=true, silent=true }

--   -- Mappings.
--   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
--   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- end

-- require'lspconfig'.pyright.setup{
--   on_attach = on_attach
-- }
-- vim.lsp.set_log_level("debug")
