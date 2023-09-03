--
-- auto-save
--
-- enable autosave on startup
vim.g.auto_save = 1
-- display last save time in status bar
vim.g.auto_save_silent = 0
-- save on insertmode leave and normal mode text change
vim.g.auto_save_events = { "InsertLeave", "TextChanged" }
