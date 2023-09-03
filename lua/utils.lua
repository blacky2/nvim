local M = {}

-- local mapper = vim.api.nvim_set_keymap
local mapper = vim.keymap.set

-- map
function M.nmap(lhs, rhs)
   mapper('n', lhs, rhs, {silent = true})
end

function M.vmap(lhs, rhs)
  mapper('v', lhs, rhs, {silent = true})
end

function M.imap(lhs, rhs)
  mapper('i', lhs, rhs, {silent = true})
end

-- noremap
function M.nnoremap(lhs, rhs)
  mapper('n', lhs, rhs, {noremap = true, silent = true})
end

function M.vnoremap(lhs, rhs)
  mapper('v', lhs, rhs, {noremap = true, silent = true})
end

function M.inoremap(lhs, rhs)
  mapper('i', lhs, rhs, {noremap = true, silent = true})
end

return M
