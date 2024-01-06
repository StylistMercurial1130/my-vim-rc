print("lazy loading !")
plugins = {
	 { 'rose-pine/neovim', name = 'rose-pine' },
	 {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}},
	 {
		 'nvim-telescope/telescope.nvim', tag = '0.1.5',
		 dependencies = { 'nvim-lua/plenary.nvim' }
	 },
	 {
		 "williamboman/mason.nvim",
		 "williamboman/mason-lspconfig.nvim",
		 "neovim/nvim-lspconfig",
	 },
	 {
		 'hrsh7th/cmp-nvim-lsp',
		 'hrsh7th/cmp-buffer',
		 'hrsh7th/cmp-path',
		 'hrsh7th/cmp-cmdline',
		 'hrsh7th/nvim-cmp'
	 }
}

require("lazy").setup(plugins)
