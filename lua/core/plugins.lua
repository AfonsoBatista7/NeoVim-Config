local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Sets up Lazy Plugin Manager

-- Grabs Configs from Plugins Folder
local function conf(config_name)
	return require(string.format("core.plugin_config.%s", config_name))
end

require("lazy").setup({
    {
       "lervag/vimtex",
       lazy = false,     -- we don't want to lazy load VimTeX
       config = conf("vimtex"),
    },
    {
	-- Main Color Scheme
	"catppuccin/nvim",
	name="catppuccin",
	priority=1000,
	config = conf("catppuccin"),
    },
    {
	-- File tree
	'nvim-tree/nvim-tree.lua',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = conf("nvim-tree")
    },
    {
	"nvim-tree/nvim-web-devicons",
	config = conf("nvim-web-devicons"),
	name = "nvim-web-devicons",
	lazy = true,
    },
    {
	-- Syntax Highlighting
	'nvim-treesitter/nvim-treesitter',
	config = conf("nvim-treesitter")
    },
    {
	-- File Searching
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
                {'nvim-telescope/telescope-fzf-native.nvim', build='make'}
	},
	config = conf("telescope")
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = conf("telescope-browser")
    },
    -- LSP Support
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
	"neovim/nvim-lspconfig",
	-- This config is applied to all 3 plugins
	config = conf("lsp-config")
    },
    -- Completion with LSP
    {'hrsh7th/cmp-nvim-lsp'},
    -- Loads Function Signature Help
    {'hrsh7th/cmp-nvim-lsp-signature-help'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{
		'hrsh7th/nvim-cmp',
		config = conf("nvim-cmp")
	},
	{ 'hrsh7th/vim-vsnip' },
    -- { 'hrsh7th/cmp-vsnip' },
	{ 'hrsh7th/vim-vsnip-integ' },
-- BEHAVIOUR
    -- Colorizes Color Codes
    {
        'norcalli/nvim-colorizer.lua',
		config = function ()
			require("colorizer").setup({
				"*",
				"!git"
			})
		end,
    },
-- Functionalities
    {
        "windwp/nvim-autopairs",
        opts = {}
    },
    -- Disables Highlight after search
    { 'romainl/vim-cool' },
    -- Surround utilities
    {'tpope/vim-surround'},
    -- General Vim defaults users generally agree on
    {
        'numToStr/Comment.nvim',
        config = function ()
            require('Comment').setup()
        end,
        lazy = false,
    },
    -- Shows current cursor context
    {'wellle/context.vim'},
    -- Highlighting on comments
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = conf('todo-comments')
    },
	-- Tmux Navigation
    {'christoomey/vim-tmux-navigator'},
    {'simeji/winresizer',
        init = function() vim.g.winresizer_start_key = '<C-p>' end
    },
})
