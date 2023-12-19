local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-a>', builtin.find_files, {})
vim.keymap.set('n', '<c-s>', builtin.live_grep, {})
vim.keymap.set('n', '<c-f>', builtin.grep_string, {})
vim.keymap.set('n', '<c-h>', builtin.oldfiles, {})