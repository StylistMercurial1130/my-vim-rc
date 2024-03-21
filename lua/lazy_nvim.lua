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
	 },
	 { "blazkowolf/gruber-darker.nvim" },
	 "rebelot/kanagawa.nvim",
	 'liuchengxu/space-vim-dark',
	 "iagorrr/noctishc.nvim",
	{
    	"mcchrish/zenbones.nvim",
    	"rktjmp/lush.nvim"
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{ "EdenEast/nightfox.nvim" }, -- lazy
	{ "miikanissi/modus-themes.nvim", priority = 1000 },
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "savq/melange-nvim" },
	{
		'ribru17/bamboo.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('bamboo').setup {
				-- optional configuration here
			}
			require('bamboo').load()
		end,
	},
}

require("lazy").setup(plugins)
