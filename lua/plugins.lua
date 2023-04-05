servers = { 'clangd', 'rust_analyzer', 'tsserver', 'lua_ls', 'html', 'cssls' }

require("packer").startup(function(use)
  -- The package manager itself
  use("wbthomason/packer.nvim")
  -- For installation of LSPs
  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  })
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
  -- LSP
  use({
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local luasnip = require 'luasnip'
      local cmp = require 'cmp'
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({ capabilities = capabilities })
      end
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
              ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
              ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end,
    requires = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
  })
  -- Remember keymaps
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  })
end)
