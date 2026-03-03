local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Theme
  
--   {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function()
--     require("gruvbox").setup({
--       contrast = "hard",
--       transparent_mode = false,
--     })
--     vim.cmd.colorscheme("gruvbox")
--   end,
-- },
{
  "RRethy/base16-nvim",
  config = function()
    vim.cmd("colorscheme base16-oceanicnext")
  end,
},
{
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
  end
},

{
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim", -- optional but recommended
  },
  config = true,
},



  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    },
  },
 
  {"numToStr/Comment.nvim", opts = {} },
  { "echasnovski/mini.surround", version = false },



  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Treesitter
  {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
      },
      highlight = { enable = true },
    },
  },
  }
,

  -- Rust LSP (BEST way)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
  },

  -- Autocomplete
  {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },
}
,

  {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "ts_ls", "eslint" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({})
      lspconfig.eslint.setup({})
    end,
  },
},
{
  { "windwp/nvim-autopairs", config = true },
  { "windwp/nvim-ts-autotag", config = true },
},



  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("pyright", {})
      vim.lsp.enable("pyright")
    end,
  },

  --folding
  {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  },


  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = { theme = "auto" }
      })
    end,
  },
})

local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})

