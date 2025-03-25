local opt = vim.opt
local g = vim.g

-- General
opt.mouse = "a"                 -- Enable mouse support
opt.clipboard = "unnamedplus"   -- Use system clipboard
opt.swapfile = false            -- Don't use swapfile
opt.backup = false              -- Don't create backup files
opt.undofile = true             -- Persistent undo
opt.confirm = true              -- Confirm to save changes before exiting

-- UI
opt.number = true               -- Show line numbers
opt.relativenumber = true       -- Relative line numbers
opt.cursorline = true           -- Highlight current line
opt.signcolumn = "yes"          -- Always show the sign column
opt.termguicolors = true        -- True color support
opt.scrolloff = 8               -- Minimum lines to keep above/below cursor
opt.sidescrolloff = 8

-- Indentation
opt.tabstop = 4                 -- Number of spaces tabs count for
opt.shiftwidth = 4              -- Size of an indent
opt.expandtab = true            -- Use spaces instead of tabs
opt.smartindent = true          -- Auto-indent new lines

-- Search
opt.ignorecase = true           -- Case-insensitive search...
opt.smartcase = true            -- ... unless there's a capital letter
opt.hlsearch = true             -- Highlight search results
opt.incsearch = true            -- Show search matches as you type

-- Splits
opt.splitright = true           -- Vertical splits to the right
opt.splitbelow = true           -- Horizontal splits below

-- Extras
opt.lazyredraw = true           -- Don't redraw while executing macros
opt.updatetime = 200            -- Faster completion
