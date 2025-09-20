return {
	"nvimtools/none-ls.nvim",
	name = "none-ls",
	depencies = { "nvim-tool/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")
		local latexindent = {
			name = "latexindent",
			method = null_ls.methods.FORMATTING,
			filetypes = { "tex", "plaintex", "latex" },
			generator = null_ls.formatter({
				command = "latexindent",
				args = { "-l", "-y=backup:0", "-o", "/dev/stdout" },
				to_temp_file = false,
			}),
		}

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.yamlfmt,
				latexindent,
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ timeout_ms = 10000 })
		end, {})
	end,
}
