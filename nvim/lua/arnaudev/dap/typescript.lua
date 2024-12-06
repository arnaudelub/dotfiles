require("dap-vscode-js").setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }
})

for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            preLaunchTask= "tsc: build - tsconfig.json",
            outFiles = {"${workspaceFolder}/dist/**/*.js"}
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests Current file",
            runtimeExecutable = "node",
            runtimeArgs = {
                "/usr/local/bin/jest",
                "--config=${workspaceFolder}/jest.config.ts",
                "${file}"
            },
            sourceMaps = true,
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        },
{
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            runtimeExecutable = "node",
            runtimeArgs = {
                "/usr/local/bin/jest",
            },
            sourceMaps = true,
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Mocha Tests",
            runtimeExecutable = "npm",
            runtimeArgs = {
                "run-script",
                "test"
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Mocha test current file",
            runtimeExecutable = "node",
            runtimeArgs = {
                "/usr/local/bin/mocha",
                "--no-timeouts",
                "--colors",
                "--require",
                "ts-node/register",
                "${file}"
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Mocha test selected text",
            runtimeExecutable = "node",
            runtimeArgs = {
                "/usr/local/bin/mocha",
                "--no-timeouts",
                "--colors",
                "--require",
                "ts-node/register",
                "${file}",
                "-t",
                "${TestName}"
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        }
    }
end
