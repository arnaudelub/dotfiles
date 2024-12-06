local dap = require("dap")

  dap.adapters.dart = {
    type = "executable",
    command = "dart",
    -- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
    args = {"debug_adapter"}
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch Development Latest",
      -- The nvim-dap plugin populates this variable with the filename of the current buffer
      program = "lib/main_development.dart",
      -- The nvim-dap plugin populates this variable with the editor's current working directory
      cwd = "${workspaceFolder}",
      args =  { "--flavor", "development", "--target", "lib/main_development.dart",
        "--dart-define=API=/api/v1",
        "--dart-define=ENVIRONMENT=test",
        "--dart-define=SERVICE_NAME=concrete-mobile-app",
        "--dart-define=CLIENT_ID=concrete-client",
        "--dart-define=REDIRECT_URL=com.nexplore.bcqd:/oauthorize",
        "--dart-define=SCOPES=email_profile",
        "--dart-define=NAMESPACE=latest"}, -- Note for Dart apps this is args, for Flutter apps toolArgs
    },
    {
      type = "dart",
      request = "launch",
      name = "Launch Development custom",
      -- The nvim-dap plugin populates this variable with the filename of the current buffer
      program = "lib/main_development.dart",
      -- The nvim-dap plugin populates this variable with the editor's current working directory
      cwd = "${workspaceFolder}",
      args =  { "--flavor", "development", "--target", "lib/main_development.dart",
        "--dart-define=API=/api/v1",
        "--dart-define=ENVIRONMENT=test",
        "--dart-define=SERVICE_NAME=concrete-mobile-app",
        "--dart-define=CLIENT_ID=concrete-client",
        "--dart-define=REDIRECT_URL=com.nexplore.bcqd:/oauthorize",
        "--dart-define=SCOPES=email_profile",
        "--dart-define=NAMESPACE=arnaud"}, -- Note for Dart apps this is args, for Flutter apps toolArgs
    },
{
      type = "dart",
      request = "launch",
      name = "Launch Development QA",
      -- The nvim-dap plugin populates this variable with the filename of the current buffer
      program = "lib/main_development.dart",
      -- The nvim-dap plugin populates this variable with the editor's current working directory
      cwd = "${workspaceFolder}",
      args =  { "--flavor", "development", "--target", "lib/main_development.dart",
        "--dart-define=API=/api/v1",
        "--dart-define=ENVIRONMENT=test",
        "--dart-define=SERVICE_NAME=concrete-mobile-app",
        "--dart-define=CLIENT_ID=concrete-client",
        "--dart-define=REDIRECT_URL=com.nexplore.bcqd:/oauthorize",
        "--dart-define=SCOPES=email_profile",
        "--dart-define=NAMESPACE=qa"}, -- Note for Dart apps this is args, for Flutter apps toolArgs
    },

    {
      type = "dart",
      request = "launch",
      name = "Run all test",
      -- The nvim-dap plugin populates this variable with the filename of the current buffer
      program = "./test/",
      -- The nvim-dap plugin populates this variable with the editor's current working directory
      cwd = "${workspaceFolder}",
    }
  }
