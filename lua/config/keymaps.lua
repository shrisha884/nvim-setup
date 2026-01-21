vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<leader>e", "<cmd>Neotree toggle<CR>")
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap("n", "<leader>w", "<cmd>w<CR>")
keymap("n", "<leader>q", "<cmd>q<CR>")

keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition (LSP)" })
keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration (LSP)" })

keymap("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>")
keymap("n", "<C-a>", "ggVG")
keymap("n", "<leader>pp", "<cmd>Neotree reveal<CR>")
keymap("n", "<leader>nt", "<cmd>tabnew<CR>")
keymap("n", "<leader>tt", "<cmd>tabclose<CR>")
keymap("n", "<leader>nf", "<cmd>Neotree focus<CR>")
keymap("n", "<leader>l", "<cmd>bnext<CR>")
keymap("n", "<leader>h", "<cmd>bprevious<CR>")
keymap("n", "<leader>bd", "<cmd>bdelete<CR>")
keymap("n", "<leader><Esc>", "<cmd>nohlsearch<CR>")

keymap("n", "<leader>+", "<cmd>echo 'Font size is controlled by your terminal'<CR>")
keymap("n", "<leader>-", "<cmd>echo 'Font size is controlled by your terminal'<CR>")

keymap("n", "<leader>m", function()
  vim.o.modifiable = not vim.o.modifiable
  print("Modifiable: " .. tostring(vim.o.modifiable))
end)
