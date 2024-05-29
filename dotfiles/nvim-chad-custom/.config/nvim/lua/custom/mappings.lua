local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dgr"] = {
      function()
        require('dap-python').debug_test()
      end,
      "Debug python test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

M.telescope_lsp_references = {
  n = {
     ["gr"] = {"<cmd> Telescope lsp_references <CR>", "Telescope lsp_references"},
  },

}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>te"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },

    -- resize to 50
    ["<leader>er"] = { "<cmd> NvimTreeResize 50 <CR>", "Resize nvimtree" },
  },
}

M.nvim_test = {
  n = {
    -- start nearest test
    ["<leader>tn"] = { "<cmd> TestNearest <CR>", "Run Nearest Test" },
    -- start last test
    ["<leader>tl"] = { "<cmd> TestLast <CR>", "Run Last Test" },
    -- start test suite
    ["<leader>ts"] = { "<cmd> TestSuite <CR>", "Run Test Suite" },
    -- start test file
    ["<leader>tf"] = { "<cmd> TestFile <CR>", "Run Tests from File" },
    -- start test visit 
    ["<leader>tv"] = { "<cmd> TestVisit <CR>", "Open Last Test Run" },
  },
}

return M
