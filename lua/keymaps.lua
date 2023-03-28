local keymap = vim.keymap


local opts = { silent = true }
local coc_opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

-- My keymaps
keymap.set("n", "<Leader>e", ":NeoTreeFocusToggle<CR>", opts)
keymap.set("n", "<Leader>f", ":call CocActionAsync('format')<CR>", opts)
keymap.set("n", "<Leader>t", ":lua require('telescope.builtin').oldfiles()<CR>", opts)
keymap.set("n", "<Leader>r", ":source %<CR>:PackerInstall<CR>:PackerCompile<CR>:PackerSync<CR>", opts)
keymap.set("n", "<Leader>q", ":lua require('notify').dismiss()<CR>", opts)
keymap.set("n", "<Leader>w", ":w<CR>", opts);
keymap.set("n", "<Leader>c", "0v$y<Esc>", opts);
keymap.set("n", "<Leader>g", ":!lazygit<CR>", opts);
keymap.set("n", "<Leader>n", ":noh<CR>", opts);

-- Function for Coc
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Coc keymaps
keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
  coc_opts)
keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], coc_opts)
keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], coc_opts)
keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
