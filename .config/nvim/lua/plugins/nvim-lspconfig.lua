return {
  "neovim/nvim-lspconfig",
  config = function()
    -- CONFIGURE servers (with settings)
    vim.lsp.config('ts_ls', {
      cmd = { 'typescript-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
      init_options = {
        preferences = {
          includeCompletionsForModuleExports = true,
          includeCompletionsWithInsertText = true,
        },
      },
      settings = {
        typescript = {
          suggest = {
            includeCompletionsForModuleExports = true,
          },
        },
        javascript = {
          suggest = {
            includeCompletionsForModuleExports = true,
          },
        },
      }
    })
    vim.lsp.config('angularls', {
      cmd = { 'ngserver', '--stdio', '--tsProbeLocations', vim.fn.getcwd(), '--ngProbeLocations', vim.fn.getcwd() },
      filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx' },
      root_markers = { 'angular.json', 'project.json' },
    })

    -- ENABLE servers (after configuration)
    vim.lsp.enable({ 'ts_ls', 'angularls', 'lua_ls' })
    -- Keybindings
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end,
    })
  end,
}
