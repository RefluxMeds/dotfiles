local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      function ()
        require('dap').toggle_breakpoint()
      end,
      "Add breakpoint at line"
    },
    ["<F5>"] = {
      function ()
        if vim.fn.filereadable(".vscode/launch.json") then
          require('dap.ext.vscode').load_launchjs(nil, { go = {'go'} })
        end
        require('dap').continue()
      end,
      "Continue start/debug"
    },
    ["<F2>"] = {
      function ()
        require('dap').step_over()
      end,
      "Debugger step over"
    },
    ["<F3>"] = {
      function ()
        require('dap').step_into()
      end,
      "Debugger step into"
    },
    ["<F4>"] = {
      function ()
        require('dap').step_out()
      end,
      "Debugger step out"
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
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.dap_ui = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      function ()
        require('dapui').toggle()
      end,
      "Toggle DAP UI"
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

return M
