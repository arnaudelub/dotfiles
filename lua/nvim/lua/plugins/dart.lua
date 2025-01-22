return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Function to find the Dart SDK path
      local function get_dart_sdk_path()
        -- Try to get from DART_SDK environment variable
        local dart_sdk = os.getenv 'DART_SDK'
        if dart_sdk then
          return dart_sdk
        end

        -- Try to get from `which dart` or `where dart`
        local dart_path
        if vim.fn.has 'win32' == 1 then
          dart_path = vim.fn.trim(vim.fn.system 'where dart')
        else
          dart_path = vim.fn.trim(vim.fn.system 'which dart')
        end

        if dart_path ~= '' then
          -- Remove the /bin/dart from the path
          return vim.fn.fnamemodify(dart_path, ':h:h')
        end

        -- Default paths based on OS
        if vim.fn.has 'win32' == 1 then
          return 'C:/Program Files/Dart/dart-sdk'
        elseif vim.fn.has 'mac' == 1 then
          return '/usr/local/opt/dart/libexec'
        else
          return '/usr/lib/dart'
        end
      end

      local dart_sdk = get_dart_sdk_path()
      local dartls_path = dart_sdk .. '/bin/dart' .. (vim.fn.has 'win32' == 1 and '.exe' or '')

      -- Configure the Dart LSP with enhanced settings
      --     require('lspconfig').dartls.setup {
      --       cmd = { dartls_path, 'language-server', '--protocol=lsp' },
      --       filetypes = { 'dart' },
      --       root_dir = require('lspconfig.util').root_pattern('pubspec.yaml', '.git', 'analysis_options.yaml'),
      --       init_options = {
      --         onlyAnalyzeProjectsWithOpenFiles = false, -- Changed to false to analyze all files
      --         suggestFromUnimportedLibraries = true,
      --         closingLabels = true,
      --         outline = true,
      --         flutterOutline = true,
      --       },
      --       settings = {
      --         dart = {
      --           completeFunctionCalls = true,
      --           showTodos = true,
      --           analysisExcludedFolders = {
      --             vim.fn.expand '$HOME/.pub-cache',
      --             vim.fn.expand '$HOME/AppData/Local/Pub/Cache',
      --             vim.fn.expand '$HOME/.cargo',
      --             vim.fn.expand '$HOME/.dart-tool',
      --           },
      --           updateImportsOnRename = true,
      --           enableSnippets = true,
      --           enableSdkFormatter = true,
      --           analysisServerPluginCrashReporting = true,
      --           analysisServerFolding = true,
      --           enableCompletionCommitCharacters = true,
      --           includeCompletionsWithSnippetText = true,
      --           maxCompletionItems = 1000,
      --         },
      --       },
      --       capabilities = require('blink.cmp').get_lsp_capabilities(),
      --       on_attach = function(client, bufnr)
      --         -- Enable document formatting
      --         client.server_capabilities.documentFormattingProvider = true

      --         -- Set up buffer-local keymaps
      --         local opts = { noremap = true, silent = true, buffer = bufnr }
      --         vim.keymap.set('n', '<leader>df', vim.lsp.buf.format, opts)
      --         vim.keymap.set('n', '<leader>di', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
      --         vim.keymap.set('n', '<leader>dr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      --       end,
      --}
    end,
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require('flutter-tools').setup {
        lsp = {
          -- Reuse the enhanced LSP settings from above
          settings = {
            dart = {
              completeFunctionCalls = true,
              showTodos = true,
              enableSnippets = true,
              updateImportsOnRename = true,
              enableSdkFormatter = true,
              analysisServerPluginCrashReporting = true,
              analysisServerFolding = true,
              enableCompletionCommitCharacters = true,
              includeCompletionsWithSnippetText = true,
              maxCompletionItems = 1000,
            },
          },
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        widget_guides = {
          enabled = true,
        },
        dev_log = {
          enabled = true,
          open_cmd = 'tabedit',
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
      }
    end,
  },
}
