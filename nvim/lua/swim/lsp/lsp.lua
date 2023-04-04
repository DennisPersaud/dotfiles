-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
	"pyright",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.declaration()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)

	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol(client)
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>rr", function()
		vim.lsp.buf.references(client)
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)

	-- Displays error diagnostic gl
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev(client)
	end, opts)
	vim.keymap.set("n", "<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end)

lsp.setup()

-------------------------------------------------------------------------------------------
-- Formatting
local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)
		-- Autoformat
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
		-- Autoformat end
	end,
	sources = {
		-- Replace these with the tools you have installed
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.csharpier,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.ktlint,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.sqlformat,
		null_ls.builtins.formatting.perltidy,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.tidy,
		-- diagnostics
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.cpplint,
		null_ls.builtins.diagnostics.cppcheck,
		null_ls.builtins.diagnostics.php,
		null_ls.builtins.diagnostics.tidy,
	},
})

-------------------------------------------------------------------------------------------

-- Setup neovim lua configuration
require("neodev").setup()

-------------------------------------------------------------------------------------------
-- Mason
-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
	clangd = {},
	gopls = {},
	pyright = {},
	rust_analyzer = {},
	tsserver = {},

	sumneko_lua = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Setup mason so it can manage external tooling
require("mason").setup()
-- Setup mason-nvim-dap after mason
require("mason-nvim-dap").setup({
	ensure_installed = { "python" },
})

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--     }
--   end,
-- }

-------------------------------------------------------------------------------------------
