local js_based_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
-- local js_based_languages = { "typescriptreact", "javascriptreact" }

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
	-- debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
    -- debugger_cmd = { 'js-debug-adapter' },
    -- adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

require("dap").configurations.typescriptreact = { -- change to typescript if needed
    {
        type = "pwa-chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

--[[ for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    {
        type = "pwa-chrome",
        request = "attach",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
  }
end ]]

--[[ for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    ... -- see below
  }
end ]]

--[[ dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/path/to/vscode-chrome-debug/out/src/chromeDebug.js"} -- TODO adjust
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.typescriptreact = { -- change to typescript if needed
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
} ]]
