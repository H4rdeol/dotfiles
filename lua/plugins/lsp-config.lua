---@diagnostic disable: unused-local
return {
	{
		"williamboman/mason.nvim",
        lazy = false,
        config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
        opts = {
            auto_install = true,
        },
	},
	{
		"neovim/nvim-lspconfig",
        lazy = false,
		config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
			lspconfig.rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							enable = false,
						},
					},
				},
                capabilities = capabilities
			})
			lspconfig.bashls.setup({
                capabilities = capabilities
            })
			lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
			lspconfig.ast_grep.setup({
                capabilities = capabilities
            })
			lspconfig.clangd.setup({
                capabilities = capabilities
            })
			lspconfig.neocmake.setup({
                capabilities = capabilities
            })
			lspconfig.gopls.setup({
                capabilities = capabilities
            })
			lspconfig.hls.setup({
				filetypes = { "haskell", "lhaskell", "cabal" },
                capabilities = capabilities
			})
			lspconfig.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
                capabilities = capabilities
			})
			lspconfig.jsonls.setup({
                capabilities = capabilities
            })
			lspconfig.julials.setup({
                capabilities = capabilities
            })
			lspconfig.pylyzer.setup({
                capabilities = capabilities
            })
			lspconfig.pylsp.setup({
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { "W391" },
								maxLineLength = 100,
							},
						},
					},
				},
                capabilities = capabilities
			})
			lspconfig.rubocop.setup({
                capabilities = capabilities
            })
			lspconfig.vuels.setup({
                capabilities = capabilities
            })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
