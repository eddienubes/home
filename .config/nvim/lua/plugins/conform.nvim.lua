return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        conform.setup({
          formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "black", "isort", stop_after_first = true },
            -- You can customize some of the format options for the filetype (:help conform.format)
            rust = { "rustfmt", lsp_format = "fallback" },
            -- Conform will run the first available formatter
            javascript = { "prettier", stop_after_first = true },
            c = { "clang-format" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
          },
        })

        vim.keymap.set({ "n", "v" }, "<A-S-f>", function()
          conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end, { desc = "Format file or range (in visual mode)" })
    end
}
