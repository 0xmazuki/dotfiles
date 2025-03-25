local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
keymap("n", "<Esc>", "<cmd>noh<CR>", opts)                      -- Clear search highlights
keymap("n", "x", '"_x', opts)                                   -- Don't copy character on 'x'
keymap("n", "<leader>q", "<cmd>q<CR>", opts)                    -- Quit
keymap("n", "<leader>w", "<cmd>w<CR>", opts)                    -- Save

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Tabs
keymap("n", "<leader>tt", "<cmd>tabnew<CR>", opts)
keymap("n", "<leader>to", "<cmd>tabonly<CR>", opts)
keymap("n", "<leader>tc", "<cmd>tabclose<CR>", opts)
keymap("n", "<leader>tp", "<cmd>tabprevious<CR>", opts)
keymap("n", "<leader>tn", "<cmd>tabnext<CR>", opts)

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up/down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor centered during scrolling/searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- System clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- Disable annoying Ex mode
keymap("n", "Q", "<nop>", opts)

-- Telescope shortcuts
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Nvim Tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Buffers
keymap("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", opts)
for i = 1, 9 do
  keymap("n", "<leader>"..i, ":BufferLineGoToBuffer "..i.."<CR>", opts)
end

-- LSP
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
