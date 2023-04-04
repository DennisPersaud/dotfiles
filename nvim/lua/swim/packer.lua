-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Fuzzy Finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Syntax Highlighting/Intellisense/AST
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	-- Git
	use("kdheepak/lazygit.nvim")
	use("tpope/vim-rhubarb")

	-- LSP, DAP, Linter, Formatter
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			-- Snippet Collection (Optional)
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use("folke/neodev.nvim")
	use("onsails/lspkind.nvim")

	-- Formatters
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")
	use("wesleimp/stylua.nvim")

	-- DAP
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("jayp0521/mason-nvim-dap.nvim")

	-- Magma
	use({ "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" })

	-- Miscellaneous
	use("mbbill/undotree")
	use("lewis6991/gitsigns.nvim")
	use("udalov/kotlin-vim")
	use("lukas-reineke/indent-blankline.nvim")
	use("jiangmiao/auto-pairs")
	use("akinsho/toggleterm.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- Theme
	use("ajmwagar/vim-deus")
	use("norcalli/nvim-colorizer.lua")
	use("nvim-lualine/lualine.nvim")
	use("nvim-tree/nvim-web-devicons")
	-- use("goolord/alpha-nvim")
	use("akinsho/bufferline.nvim")

	if is_bootstrap then
		require("packer").sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})
