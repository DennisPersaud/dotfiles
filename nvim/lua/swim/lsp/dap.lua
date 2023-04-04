--     Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
--     Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
--
-- See :help dap.txt, :help dap-mapping and :help dap-api.

local opts = { buffer = bufnr, remap = false }

-- nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR> nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
-- nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>

vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opts)
vim.keymap.set("n", "<leader>si", ":lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("n", "<leader>so", ":lua require'dap'.step_over()<CR>", opts)
vim.keymap.set("n", "<leader>ro", ":lua require'dap'.repl.open()<CR>", opts)
vim.keymap.set("n", "<leader>dl", ":lua require'dap'.repl.last()<CR>", opts)

-- Dap UI
require("dapui").setup()
vim.keymap.set("n", "<leader>dt", "require(''dapui').toggle()<CR>", opts)

-- :h dap.txt search:breakpoint
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⛔", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "❌", texthl = "", linehl = "", numhl = "" })
