local keymap = vim.keymap

local flags = { silent = true }

keymap.set("n", "<Leader>e", ":NeoTreeFocusToggle<CR>", flags)
keymap.set("n", "<Leader>f", ":call CocActionAsync('format')<CR>", flags)
keymap.set("n", "<Leader>t", ":lua require('telescope.builtin').oldfiles()<CR>", flags)
keymap.set("n", "<Leader>r", ":source %<CR>:PackerInstall<CR>:PackerCompile<CR>:PackerSync<CR>", flags)
keymap.set("n", "<Leader>q", ":lua require('notify').dismiss()<CR>", flags)
keymap.set("n", "<Leader>w", ":w<CR>", flags);
keymap.set("n", "<Leader>cl", "0v$y<Esc>", flags);
