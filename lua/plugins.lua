-- lazy package manager
local dein_repo = 'https://github.com/folke/lazy.nvim.git'
local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local install_path = ''

if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    dein_repo,
    '--branch=stable', -- latest stable release
    lazy_path,
  })
end
vim.opt.rtp:prepend(lazy_path)


require('lazy').setup({
  -- essintials
  'tpope/vim-repeat',                                 -- enable . for plugins (e.g. surround)
  'tpope/vim-surround',                               -- surround text
  {
    'nvim-treesitter/nvim-treesitter',                -- syntax tree parsing
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects'   -- additional treesitter text objects
    },
    build = ':TSUpdate',
  },
   -- search and find
  {
    'nvim-telescope/telescope.nvim',                  -- telescope finder ui
    dependencies = { 'nvim-lua/plenary.nvim' }        -- telescope dependency
  },
  -- helpers
  '907th/vim-auto-save',                              -- automatic saving  normalmode changes, insertmode leave
  -- {
  --   "Wansmer/treesj",                                 -- switch from one line to multi line expression
  --   keys = {
  --     { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
  --   },
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   opts = {
  --     use_default_keymaps = false,
  --     max_join_length = 150
  --   },
  -- },
  -- doc
  {
    'vimwiki/vimwiki',                                  -- wiki
    keys = {
      { "<leader>ww", "<cmd>VimwikiIndex 0<cr>", desc = "VimWiki" },
    },
    ft='markdown',
    init = require('plugins.vim_wiki').init,
  },
  {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = {'markdown', 'pandoc.markdown', 'rmd'}
  },
  {
    'lervag/vimtex',                                    -- latex
    ft='tex'
  },
  -- lsp
  {
    'neovim/nvim-lspconfig',                          -- neovim lsp config utils
    dependencies = {
      'williamboman/mason-lspconfig.nvim',            -- mason lsp glue
      'williamboman/mason.nvim'                       -- external tool package manager (lsp, dap, linters)
    },
  },
  -- completion
  {
    'hrsh7th/nvim-cmp',                               -- nvim-cmp plugin (lua based)
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',                         -- nvim-cmp lsp source
      'hrsh7th/cmp-nvim-lsp-signature-help',          -- nvim-cmp lsp parameter source
      'hrsh7th/cmp-buffer',                           -- nvim-cmp buffer source
      'hrsh7th/cmp-path',                             -- nvim-cmp path source
      'hrsh7th/cmp-cmdline',                          -- nvim-cmp cmdline source
      'hrsh7th/cmp-omni',                             -- nvim-cmp omni complete source
      -- snippets
      'saadparwaiz1/cmp_luasnip',                     -- nvim-cmp LuaSnip source
      'L3MON4D3/LuaSnip',                             -- snippets engine
      'rafamadriz/friendly-snippets',                 -- snippets
    }
  },
  -- file manager
  -- TODO nvim-neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',                 -- recomended
      'MunifTanjim/nui.nvim'                         -- ui component
    },
    keys = {
      { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup()
    end,
  },
  -- version control
  {
    'tpope/vim-fugitive',                               -- git plugin
    cmd = { 'Git' }
  },
  -- copilot
  {
    'github/copilot.vim'
  },
  -- debugging
  { require('plugins.dap') },
  -- repl
  {
    '0x100101/lab.nvim',                              -- lab (code runner, inline feedback)
    dependencies = { 'nvim-lua/plenary.nvim' },
    build = 'cd js && npm ci'
  },
  'jpalardy/vim-slime',                               -- lab (code runner, inline feedback)
  {
    'dccsillag/magma-nvim',                           -- interactive code runner with jupyter
    build = ':UpdateRemotePlugins',
  },
  'jpalardy/vim-slime',                               -- send code to tmux, screen, X11, ...
  'Vigemus/iron.nvim',                                -- interactive repls over nvim
  'pappasam/nvim-repl',                               -- repl for nvim (requires repeat)
  -- indent lines
  -- TODO prevents folds!
  -- {
  --   'lukas-reineke/indent-blankline.nvim',            -- indentation guides
  --   -- Enable `lukas-reineke/indent-blankline.nvim`
  --   -- See `:help indent_blankline.txt`
  --   opts = {
  --     char = '┊',
  --     show_trailing_blankline_indent = false,
  --   },
  -- },
  -- status line
  {
    'nvim-lualine/lualine.nvim',                      -- lua line
    dependencies = { 'nvim-tree/nvim-web-devicons' } -- icons (lua line, ...)
  },
  -- themes
  { 'jnurmine/Zenburn', lazy=true },
  { 'vim-scripts/wombat256.vim', lazy=true },
  { 'croaker/mustang-vim', lazy=true },
  { 'vim-scripts/Mustang2', lazy=true },
  { 'tomasr/molokai', lazy=true },
  { 'tanvirtin/monokai.nvim', lazy=true, priority=1000 },
  { 'shaunsingh/nord.nvim', lazy=true },
  { 'sainnhe/sonokai', lazy=true },
  { 'kyazdani42/blue-moon', lazy=true },
  { 'fenetikm/falcon', lazy=true },
  { 'marko-cerovac/material.nvim', lazy=true },
  { 'edeneast/nightfox.nvim', lazy=true },
  { 'tomasiser/vim-code-dark', lazy=true },
  {
    'briones-gabriel/darcula-solid.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    lazy=true
  },
  {
    'adisen99/codeschool.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    lazy=true
  },
})

-- treesitter
require('plugins.treesitter')
-- -- mason
require('plugins.mason')
-- -- lsp
require('plugins.nvim_lsp')
-- -- snippets
require('plugins.snippets')
-- nvim-comp
require('plugins.nvim_cmp')
-- telescope
require('plugins.telescope')
-- vimtex
require('plugins.vimtex')
-- git
require('plugins.fugitive')
-- status line
require('plugins.lualine')
-- autosave
require('plugins.autosave')
-- dap
require('plugins.dap')

-- test
require('lab').setup({
  quick_data = {
    enabled = false,
  }
})

vim.g.slime_target = 'tmux'
