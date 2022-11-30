local Remap = require("arnaudev.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local function config(_config)
	return vim.tbl_deep_extend("force", {
		on_attach = function()
            local opts = { buffer = true };
			nnoremap("gd", function() vim.lsp.buf.definition() end, opts)
			nnoremap("K", function() vim.lsp.buf.hover() end, opts)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end, opts)
			nnoremap("[d", function() vim.diagnostic.goto_next() end, opts)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end, opts)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end, opts)
			nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                filter = function(code_action)
                    if not code_action or not code_action.data then
                        return false
                    end

                    local data = code_action.data.id
                    return string.sub(data, #data - 1, #data) == ":0"
                end,
                apply = true
            }) end, opts)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end, opts)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end, opts)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		end,
	}, _config or {})
end


require("lspconfig").tsserver.setup(config())
require("lspconfig").bashls.setup(config())
require("lspconfig").dartls.setup(config())
require("lspconfig").jedi_language_server.setup(config())
require("lspconfig").yamlls.setup(config())
require("lspconfig").dockerls.setup(config())
-- who even uses this?
require("lspconfig").rust_analyzer.setup(config({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
}))

require("lspconfig").sumneko_lua.setup(config({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
}))

local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}

