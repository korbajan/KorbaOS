return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
      'fredrikaverpil/neotest-golang',
      'leoluz/nvim-dap-go', -- used by neotest-golang for the <leader>nd* debug runs
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            dap = { justMyCode = false },
          },
          require 'neotest-golang' {},
        },
      }
    end,
    keys = {
      {
        '<leader>ndt',
        function()
          require('neotest').run.run { vim.fn.expand '%', strategy = 'dap' }
        end,
        desc = 'Run File (Neotest)',
      },
      {
        '<leader>ndT',
        function()
          require('neotest').run.run { vim.uv.cwd(), strategy = 'dap' }
        end,
        desc = 'Run All Test Files (Neotest)',
      },
      {
        '<leader>ndr',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = 'Run Nearest (Neotest)',
      },
      {
        '<leader>ndl',
        function()
          require('neotest').run.run_last { strategy = 'dap' }
        end,
        desc = 'Run Last (Neotest)',
      },

      {
        '<leader>nt',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run File (Neotest)',
      },
      {
        '<leader>nT',
        function()
          require('neotest').run.run(vim.uv.cwd())
        end,
        desc = 'Run All Test Files (Neotest)',
      },
      {
        '<leader>nr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run Nearest (Neotest)',
      },
      {
        '<leader>nl',
        function()
          require('neotest').run.run_last()
        end,
        desc = 'Run Last (Neotest)',
      },
      {
        '<leader>ns',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle Summary (Neotest)',
      },
      {
        '<leader>no',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = 'Show Output (Neotest)',
      },
      {
        '<leader>nO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle Output Panel (Neotest)',
      },
      {
        '<leader>nS',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Stop (Neotest)',
      },
      {
        '<leader>nw',
        function()
          require('neotest').watch.toggle(vim.fn.expand '%')
        end,
        desc = 'Toggle Watch (Neotest)',
      },
    },
  },
}
