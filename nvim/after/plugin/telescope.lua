-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
