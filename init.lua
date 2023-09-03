-- info = debug.getinfo(1, 'S')
-- print(info.source)

-- print(os.getenv('PWD'))
-- local config_path = os.getenv('MYVIMRC')
-- print(config_path)
-- print(vim.env['MYVIMRC'])
-- local lua_dir = string.sub(info.source, 2, string.len(info.source) - 8) .. 'lua'
-- print(lua_dir)
-- vim.opt.runtimepath:append(lua_dir)

require('options')
require('keymaps')
require('commands')
require('plugins')
require('themes')
