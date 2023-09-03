--
-- fugitive (git)
--
local utils = require('utils')

utils.nmap('<leader>gs', ':Git<cr>')
utils.nmap('<leader>gc', ':Git commit<cr>')
utils.nmap('<leader>gw', ':Git write<cr>')
utils.nmap('<leader>gl', ':Git log<cr>')
utils.nmap('<leader>gd', ':Git diff<cr>')
-- " TODO improve this
-- command! Greview :Git! diff --staged

