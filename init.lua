
-- Ensure nvim can see nvm-installed node & npm
vim.env.PATH = vim.env.PATH
  .. ":" .. vim.fn.expand("~/.nvm/versions/node/v24.13.0/bin")
require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.treesitter")
require("ufo").setup()
