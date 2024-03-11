local plugins = {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = "rcarriga/nvim-dap-ui",
    init = function ()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dapui").setup(opts)
      require("core.utils").load_mappings("dap_ui")
      require("dap").listeners.before.attach.dapui_config = function()
        require("dapui").open()
      end
      require("dap").listeners.before.launch.dapui_config = function()
        require("dapui").open()
      end
      require("dap").listeners.before.event_terminated.dapui_config = function()
        require("dapui").close()
      end
      require("dap").listeners.before.event_exited.dapui_config = function()
        require("dapui").close()
      end
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
}
return plugins
