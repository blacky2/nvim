local utils = require('utils')

--
-- LSP servers
--
local lsp_servers = {
  'lua_ls',
  'pylsp',
  'pyright',
  'ltex',
  'graphql',
  'clangd'
}

--
-- LSP mason config
--
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = lsp_servers
})

--
-- LSP
--
local lspconfig = require('lspconfig')


local lsp_defaults = {
  -- announce completion capbabilities of nvim-cmp
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  -- keymappings
  on_attach = function(_, bufnr)
    -- use buffernr: https://tkg.codes/guide-to-modern-neovim-setup-2021/
    -- TODO update utils function utils.nnoremap('gd', ':lua vim.lsp.buf.definition()<cr>')
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- goto unique location
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]declaration')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype Definition')
    -- goto and select
    -- plain lsp: vim.lsp.buf.references
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]references')

    -- plain lsp: vim.lsp.buf.document_symbol
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>dW', vim.lsp.buf.workspace_symbol)
    nmap('<leader>dw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    -- doc
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<c-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    -- refactor
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- commands local to lsp buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
  end
}

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

-- TOOD lua runtime path:
-- local lua_runtime_path = vim.split(package.path, ';')
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')
-- require('lspconfig').sumneko_lua.setup {
--   on_attach = function()
--     on_attach()
--     vim.cmd [[autocmd BufWritePre <buffer> lua require'stylua-nvim'.format_file()]]
--   end,
--   settings = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--         path = runtime_path,
--       },
--       diagnostics = {
--         globals = { 'vim' },
--       },
--       workspace = {
--         library = vim.api.nvim_get_runtime_file('', true),
--       },
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

local lsp_customs = {
  ['lua_ls'] = {
    settings = {
      Lua = {
        diagnostics = {
          -- let the lsp server recognize the `vim` global
          globals = { 'vim' }
        },
        workspace = {
          -- make server aware of NVIMs runtime files
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false, -- avoid luasert message
        },
        telemetry = {
          enable = false,
        },
      }
    }
  },
}

-- lsp filetype auto cmds
for _, lsp in ipairs(lsp_servers) do
  if lsp_customs[lsp] == nil then
    lspconfig[lsp].setup({})
  else
    lspconfig[lsp].setup(lsp_customs[lsp])
  end
end
