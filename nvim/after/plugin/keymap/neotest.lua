local nnoremap = require('arnaudev.keymap').nnoremap
nnoremap("<leader>os", ":lua require'neotest'.summary.open() <CR>")
nnoremap("<leader>cs", ":lua require'neotest'.summary.close() <CR>")
nnoremap("<leader>nJ", ":lua require'neotest'.run.run( {strategy = 'dap'}) <CR>")
