local nnoremap = require('arnaudev.keymap').nnoremap
nnoremap("<leader>PR", ":lua require('telescope').extensions.gh.pull_request()<cr>")
nnoremap("<leader>wr", ":lua require('telescope').extensions.gh.run()<cr>")
nnoremap("<leader>pr", ":GHOpenPR<cr>")
nnoremap("<leader>ar", ":GHApproveReview<cr>")
