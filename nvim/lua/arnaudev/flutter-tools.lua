require("flutter-tools").setup {
    decorations = {
        statusline = {
            app_version = true,
            device = true,
            project_config = true
        }
    },
    debugger = {
        enabled = true,
        run_via_dap = true,
        register_configurations = function(_)
        end,
    },
    dev_log = {
        enabled = true
    },
    lsp = {
        color = {
            enabled = true,

        }
    },
    widget_guides = {
        enabled = false,
    },
}

