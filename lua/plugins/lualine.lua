-- 
-- status line
--
local base16 = require('lualine.themes.base16')

require('lualine').setup({
  options = {
    icons_enabled = true,
    -- theme = 'onedark',
    theme = base16,
  }
})


