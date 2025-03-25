local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize Lazy 
require("lazy").setup({
  -- Gruvbox colorscheme
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("gruvbox")
        -- Make background transparent
        vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
        vim.cmd [[ highlight SignColumn guibg=NONE ]]
    end },
  -- Statusline
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
          icons_enabled = true,
          section_separators = "",
          component_separators = "",
        },
      })
  end },

  {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({})
  end },

  {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "bash", "typescript", "javascript", "tsx", "json", "html", "css"
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      auto_install = true,
    })
  end, },
   {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup()
  end,
},

    {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        seperator_style = {" ", " "}
      },
    })
  end,},
    {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
  end,
},
    {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright" }, -- Add LSPs you need
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")
      local servers = { "lua_ls", "ts_ls", "pyright" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },

  -- Autocompletion (nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
})
