require("packer").startup(function(use)
  -- The package manager itself
  use("wbthomason/packer.nvim")
  -- Color theme
  use({
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  })
  -- Cool tree on the left
  use({
    "nvim-neo-tree/neo-tree.nvim",
    requires = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 30,
        },
      })
    end,
  })
  -- Autoclose brackets
  use({
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup({})
    end,
  })
  -- Useful menues
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          initial_mode = "normal",
        },
      })
    end,
  })
  -- Nice new guis
  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup({})
    end,
    requires = { "rcarriga/nvim-notify" },
  })
  use({
    "neoclide/coc.nvim",
    commit = "release",
  })
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  })
end)
