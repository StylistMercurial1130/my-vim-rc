
local colourschemes = {
	["rose-pine"] = function() 
		require('rose-pine').setup({
			--- @usage 'auto'|'main'|'moon'|'dawn'
			variant = 'main',
			--- @usage 'main'|'moon'|'dawn'
			dark_variant = 'main',
			bold_vert_split = false,
			dim_nc_background = true,
			disable_background = false,
			disable_float_background = false,
			disable_italics = true,

			--- @usage string hex value or named color from rosepinetheme.com/palette
			groups = {
				background = 'base',
				background_nc = '_experimental_nc',
				panel = 'surface',
				panel_nc = 'base',
				border = 'highlight_med',
				comment = 'muted',
				link = 'iris',
				punctuation = 'subtle',

				error = 'love',
				hint = 'iris',
				info = 'foam',
				warn = 'gold',

				headings = {
					h1 = 'iris',
					h2 = 'foam',
					h3 = 'rose',
					h4 = 'gold',
					h5 = 'pine',
					h6 = 'foam',
				}
				-- or set all headings at once
				-- headings = 'subtle'
			},

			-- Change specific vim highlight groups
			-- https://github.com/rose-pine/neovim/wiki/Recipes
			highlight_groups = {
				ColorColumn = { bg = 'rose' },

				-- Blend colours against the "base" background
				CursorLine = { bg = 'foam', blend = 10 },
				StatusLine = { fg = 'love', bg = 'love', blend = 10 },

				-- By default each group adds to the existing config.
				-- If you only want to set what is written in this config exactly,
				-- you can set the inherit option:
				Search = { bg = 'gold', inherit = false },
			}
		})

		-- Set colorscheme after options
		vim.cmd('colorscheme rose-pine')
		vim.api.nvim_set_hl(0,"Normal",{ bg = "none" })	
		vim.api.nvim_set_hl(0,"NormalFloat",{ bg = "none" })
	end,
	["grubber"] = function()
		require("gruber-darker").setup {
			italic = {
				strings = false,
				comments = false,
				operators = false,
				folds = false
			}
		}
		vim.cmd("colorscheme gruber-darker")
	end,
	["kanagawa"] = function()
			-- Default options:
		require('kanagawa').setup({
				compile = false,             -- enable compiling the colorscheme
				undercurl = true,            -- enable undercurls
				commentStyle = { italic = false },
				functionStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { bold = true , italic = false },
				typeStyle = { italic = false },
				transparent = false,         -- do not set background color
				dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
				terminalColors = true,       -- define vim.g.terminal_color_{0,17}
				disable_italics = true,
				colors = {                   -- add/modify theme and palette colors
					palette = {
						sumiInk0 = "#171717",
						sumiInk1 = "#171717",
						sumiInk2 = "#171717",
						sumiInk3 = "#171717",
            			fujiWhite = "#FFFFFF",
					},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return { }
				end,
				theme = "dragon",              -- Load "wave" theme when 'background' option is not set
				background = {               -- map the value of 'background' option to a theme
					dark = "wave",           -- try "dragon" !
					light = "lotus"
				},
		})
		vim.cmd("colorscheme kanagawa")
	end,
	["space-vim-dark"] = function()
		vim.opt.termguicolors = true;
		vim.cmd("colorscheme space-vim-dark");
	end,
	["noctishc"] = function() 
		vim.cmd("colorscheme noctishc");
	end,
	["zenbones"] = function()
		vim.g.italic_comments = false;
		vim.cmd("colorscheme zenbones");
	end,
	["gruvbox"] = function()
		-- Default options:
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd("colorscheme gruvbox")
	end,
	["nightfox"] = function()
		vim.cmd("colorscheme nightfox");
	end,
	["modus"] = function()
		require("modus-themes").setup({
			-- Theme comes in two styles `modus_operandi` and `modus_vivendi`
			-- `auto` will automatically set style based on background set with vim.o.background
			style = "deuteranopia",
			variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
			transparent = false, -- Transparent background (as supported by the terminal)
			dim_inactive = false, -- "non-current" windows are dimmed
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = false },
				keywords = { italic = false },
				functions = { italic = false},
				variables = { italic = false},
			},
		})
		vim.cmd("colorscheme modus");
	end,
	["adwaita"] = function()
		vim.cmd("colorscheme ")
	end,
	["catpuccin"] = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = true, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = true, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "bold" }, -- Change the style of comments
				conditionals = { },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {
			},
			custom_highlights = {},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})

		vim.cmd.colorscheme "catppuccin"
	end,
	["melange"] = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme 'melange'
	end,
	["bamboo"] = function()
		require('bamboo').setup {
			-- Main options --
			-- NOTE: to use the light theme, set `vim.o.background = 'light'`
			style = 'vulgaris', -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
			toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
			toggle_style_list = { 'vulgaris', 'multiplex', 'light' }, -- List of styles to toggle between
			transparent = false, -- Show/hide background
			dim_inactive = false, -- Dim inactive windows/buffers
			term_colors = true, -- Change terminal color as per the selected theme style
			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

			-- Change code style ---
			-- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
			-- You can also configure styles with a string, e.g. keywords = 'italic,bold'
			code_style = {
				comments = { italic = false },
				conditionals = { italic = false },
				keywords = { italic = false },
				functions = { italic = false },
				namespaces = { italic = false },
				parameters = { italic = false },
				strings = { italic = false },
				variables = { italic = false },
			},

			-- Lualine options --
			lualine = {
				transparent = false, -- lualine center bar transparency
			},

			-- Custom Highlights --
			colors = {}, -- Override default colors
			highlights = {}, -- Override highlight groups

			-- Plugins Config --
			diagnostics = {
				darker = false, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = true, -- use background color for virtual text
			},
		}
		require("bamboo").load()
	end
}

(colourschemes["bamboo"])()
