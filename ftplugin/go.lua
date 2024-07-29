local keymap = require "user.util.keymap"

keymap.add("n", "<leader>Gj", "<cmd>GoTagAdd json<cr>", "[G]opher TagAdd [j]son")
keymap.add("n", "<leader>Gy", "<cmd>GoTagAdd yaml<cr>", "[G]opher TagAdd [y]aml")
keymap.add("n", "<leader>Gm", "<cmd>GoMod tidy<cr>", "[G]opher [m]od tidy")
keymap.add("n", "<leader>Gg", "<cmd>GoGet <cr>", "[G]opher [g]et <package-name>")
keymap.add("n", "<leader>Gt", "<cmd>GoTestsAll<cr>", "[G]opher Generate all [t]ests")
keymap.add("n", "<leader>Ge", "<cmd>GoIfErr<cr>", "[G]opher Generate if [e]rr clause")
