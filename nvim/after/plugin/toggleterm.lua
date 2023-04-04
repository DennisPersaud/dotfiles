require("toggleterm").setup({
	size = 10,
	open_mapping = [[<c-\>]],
	direction = "float",
	close_on_exit = "true",
	float_opts = {
		border = "curved",
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- Toggle Terminal
-- vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>")
--

-- vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
--
-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new {
--   cmd = "lazygit",
--   hidden = true,
--   direction = "float",
--   float_opts = {
--     border = "none",
--     width = 100000,
--     height = 100000,
--   },
--   on_open = function(_)
--     vim.cmd "startinsert!"
--     -- vim.cmd "set laststatus=0"
--   end,
--   on_close = function(_)
--     -- vim.cmd "set laststatus=3"
--   end,
--   count = 99,
-- }
--
-- local node = Terminal:new { cmd = "node", hidden = true }
--
-- function _NODE_TOGGLE()
--   node:toggle()
-- end
--
-- local ncdu = Terminal:new { cmd = "ncdu", hidden = true }
--
-- function _NCDU_TOGGLE()
--   ncdu:toggle()
-- end
--
-- local htop = Terminal:new { cmd = "htop", hidden = true }
--
-- function _HTOP_TOGGLE()
--   htop:toggle()
-- end
--
-- local python = Terminal:new { cmd = "python", hidden = true }
--
-- function _PYTHON_TOGGLE()
--   python:toggle()
-- end
