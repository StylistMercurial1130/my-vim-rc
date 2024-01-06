require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver" , "lua_ls" }
})

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require('cmp')
cmp.setup {
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
	  ['<C-Space>'] = cmp.mapping.confirm {
		  behavior = cmp.ConfirmBehavior.Insert,
		  select = true,
	  },
	  ['<Tab>'] = function(fallback)
		  if not cmp.select_next_item() then
			  if vim.bo.buftype ~= 'prompt' and has_words_before() then
				  cmp.complete()
			  else
				  fallback()
			  end
		  end
	  end,
	  ['<S-Tab>'] = function(fallback)
		  if not cmp.select_prev_item() then
			  if vim.bo.buftype ~= 'prompt' and has_words_before() then
				  cmp.complete()
			  else
				  fallback()
			  end
		  end
	  end,
  },
  snippet = {
	  expand = function(args)
		  unpack = unpack or table.unpack
		  local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
		  local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
		  local indent = string.match(line_text, '^%s*')
		  local replace = vim.split(args.body, '\n', true)
		  local surround = string.match(line_text, '%S.*') or ''
		  local surround_end = surround:sub(col)

		  replace[1] = surround:sub(0, col - 1)..replace[1]
		  replace[#replace] = replace[#replace]..(#surround_end > 1 and ' ' or '')..surround_end
		  if indent ~= '' then
			  for i, line in ipairs(replace) do
				  replace[i] = indent..line
			  end
		  end

		  vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
	  end,
  },
  sources = cmp.config.sources({
	  { name = 'nvim_lsp' },
  }, {
	  { name = 'buffer' },
  })
}


local languages = { "tsserver", "csharp_ls" }
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['lua_ls'].setup {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					}
				}
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end
}

for _,language in pairs(languages) do
	require('lspconfig')[language].setup {
		capabilitie = capabilities
	}
end


vim.keymap.set('n', '<space>ed', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>qd', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


