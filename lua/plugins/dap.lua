---------
-- dap --
---------
return {
    'mfussenegger/nvim-dap',                           -- dap (debug adapter protocol)
    dependencies = {
      { 'mfussenegger/nvim-dap-python', ft='python' }, -- dap default python config
      'rcarriga/nvim-dap-ui',                          -- dap ui
      'theHamsta/nvim-dap-virtual-text',               -- dap virtual inline text
      'nvim-telescope/telescope-dap.nvim',             -- dap telescope integration
      'williamboman/mason.nvim'                        -- external tool package manager (lsp, dap, linters)
      -- jay-babu/mason-nvim-dap.nvim ??
    },
    config = function()
      require('dap-python').setup('~/.cache/nvim/debugpy/bin/python')

      -- keymappings
      vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
      vim.keymap.set('n', '<Leader>ds', function() require('dap').step_over() end)
      vim.keymap.set('n', '<Leader>dS', function() require('dap').step_into() end)
      vim.keymap.set('n', '<Leader>do', function() require('dap').step_out() end)
      vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>dC', function() require('dap').run_to_cursor() end)
      -- vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end)
      vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
      vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
      vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
      -- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      --   require('dap.ui.widgets').hover()
      -- end)
      -- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      --   require('dap.ui.widgets').preview()
      -- end)
      -- vim.keymap.set('n', '<Leader>df', function()
      --   local widgets = require('dap.ui.widgets')
      --   widgets.centered_float(widgets.frames)
      -- end)
      -- vim.keymap.set('n', '<Leader>ds', function()
      --   local widgets = require('dap.ui.widgets')
      --   widgets.centered_float(widgets.scopes)
      -- end)

      -- dap ui
      require('dapui').setup({
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = "⏏",
          },
        }
      })

      -- dap-python
      require('dap-python').test_runner = 'pytest'
      -- TODO figure out how to do this generally...
      vim.keymap.set('n', '<Leader>dt', function() require('dap-python').test_method() end)

      -- dap virtual text
      require('nvim-dap-virtual-text').setup({})
    end
}
