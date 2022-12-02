local sections = { lualine_a = { { 'mode', icons_enabled = true} },
}

require('lualine').setup({
    sections = sections,
    options = {
        theme = 'auto',
        icons_enabled = false,
    },
    winbar = {
        lualine_a ={ {'filename', file_status = true, path = 1 } },
    },

    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c ={ {'filename', file_status = true, path = 1}},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
})
