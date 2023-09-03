-- 
-- telescope 
--
local utils = require('utils')
local telescope_builtin = require('telescope.builtin')
utils.nnoremap('<space>f', telescope_builtin.find_files)
utils.nnoremap('<space>b', telescope_builtin.buffers)
utils.nnoremap('<space>g', telescope_builtin.live_grep)
utils.nnoremap('<space>h', telescope_builtin.help_tags)
