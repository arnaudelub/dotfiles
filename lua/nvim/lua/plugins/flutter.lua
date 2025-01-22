return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require('flutter-tools').setup {
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = true,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
            -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
            -- this will show the currently selected project configuration
            project_config = true,
          },
        },
        debugger = {
          enabled = true,
        },
        lsp = {
          on_attach = function(client, bufnr)
            -- Print the root directory being used
            print('Dart LSP root dir:', client.config.root_dir)
          end,
          root_dir = function()
            -- Explicitly set root finding behavior
            return vim.fn.getcwd()
            -- Alternative: use the directory containing pubspec.yaml
            -- return require('lspconfig.util').root_pattern('pubspec.yaml')(vim.fn.expand('%:p'))
          end,
          settings = {
            dart = {
              -- Previous settings remain the same
              completeFunctionCalls = true,
              enableSnippets = true,
              updateImportsOnRename = true,
              suggestFromUnimportedLibraries = true,
              enableCompletionCommitCharacters = true,
              -- Add these debugging settings
              analysisLogFile = '/tmp/dart-code.log',
              enableSdkFormatter = true,
              -- Force checking for SDK location
              sdkPath = vim.fn.expand '/opt/dart-sdk-dev',
              -- Enable verbose logging
              developerMode = true,
            },
          },
        },
        -- Ensure proper project detection
        project = {
          -- Explicitly set project detection
          detection_methods = { 'pubspec.yaml' },
        },
      }
    end,
  },
}
