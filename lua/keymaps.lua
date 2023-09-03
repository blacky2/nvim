local utils = require('utils')

vim.g.mapleader = ','
vim.g.maplocalleader = ','

utils.imap('fj', '<ESC>')
utils.imap('jf', '<ESC>')

-- quicker window movements
utils.nnoremap('<C-j>', '<C-w>j')
utils.nnoremap('<C-k>', '<C-w>k')
utils.nnoremap('<C-h>', '<C-w>h')
utils.nnoremap('<C-l>', '<C-w>l')

-- jump tags on german keyboard
utils.nnoremap('ü', '<C-]>')
utils.nnoremap('Ü', '<C-O>')
