-- Treesitter configuration
local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup({
  ensure_installed = {
    "lua", "python", "rust", "cpp", "c", "bash", "json", "yaml",
    "java", "kotlin", -- support Android development languages
  },
  highlight = { enable = true },
  indent = { enable = true },
})
