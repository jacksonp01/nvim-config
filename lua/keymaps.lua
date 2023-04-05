local keymap = vim.keymap

local opts = { silent = true }

-- My keymaps
keymap.set("n", "<Leader>e", ":NeoTreeFocusToggle<CR>", opts)
keymap.set("n", "<Leader>f", ":lua vim.lsp.buf.format()<CR>", opts)
keymap.set("n", "<Leader>t", ":lua require('telescope.builtin').oldfiles()<CR>", opts)
keymap.set("n", "<Leader>r", ":source %<CR>:PackerSync<CR>", opts)
keymap.set("n", "<Leader>q", ":lua require('notify').dismiss()<CR>", opts)
keymap.set("n", "<Leader>w", ":w<CR>", opts);
keymap.set("n", "<Leader>c", "0v$y<Esc>", opts);
keymap.set("n", "<Leader>g", ":!lazygit<CR>", opts);
keymap.set("n", "<Leader>n", ":noh<CR>", opts);
