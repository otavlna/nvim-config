require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.opt.confirm = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.o.smartindent = true -- auto-indenting when starting a new line
vim.o.shiftround = true -- round indent to multiple of 'shiftwidth'
vim.o.shiftwidth = 0 -- 0 to follow the 'tabstop' value
-- vim.o.tabstop = 2        -- tab width

vim.o.undofile = true -- enable persistent undo
vim.o.undolevels = 10000 -- 10x more undo levels

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.diagnostic.config({ virtual_text = true, update_in_insert = true, virtual_lines = { current_line = true } })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
