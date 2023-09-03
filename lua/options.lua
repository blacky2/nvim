-- prepare python venv with: python -m venv ~/.cache/nvim/py3_venv/
-- install pynvim
vim.g.python3_host_prog = vim.fn.expand('~/.cache/nvim/py3_venv/bin/python')
-- prepare node prefix with: npm --prefix ~/.cache/nvim/nodejs/ install neovim
vim.g.node_host_prog = vim.fn.expand('~/.cache/nvim/nodejs/node_modules/.bin/neovim-node-host')

-- general
vim.o.encoding = 'utf-8'    -- encoding
vim.o.mouse = 'a'           -- enable mouse
vim.o.mousemodel = 'popup'  -- windows popupmode
vim.o.diffopt = 'vertical'  -- sidebyside diff

-- search
vim.o.incsearch = true      -- find while typing
vim.o.hlsearch = true       -- highlight search terms

-- -- visual
-- vim.o.title = true       -- show title
vim.o.number = true         -- show line numbers
vim.o.termguicolors = true  -- enable colors
vim.o.background = 'dark'
-- vim.o.guicursor = nil

-- buffer
vim.o.tabstop = 2          -- implicit tab size
vim.o.shiftwidth = 2       -- other tab size
vim.o.expandtab = true     -- no real tabs (just spaces)
vim.o.autoindent = true

vim.bo.expandtab = true     -- no real tabs (just spaces)
vim.bo.tabstop = 2          -- implicit tab size
vim.bo.shiftwidth = 2       -- other tab size
vim.bo.autoindent = true

-- basic highlighting
-- vim.cmd('syntax on')
-- vim.cmd('filetype indent on')
