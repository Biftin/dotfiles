return function()
    local lsp = require("lsp-zero").preset({})
    lsp.on_attach(function(_, bufnr)
        local function opts(desc)
            return {
                buffer = bufnr,
                remap  = false,
                desc   = desc,
            }
        end

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("LSP: Hover"))

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts("LSP: Go to Definition"))
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts("LSP: Go to Declaration"))
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts("LSP: Go to Implementation"))
        vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts("LSP: Go to Type Definition"))
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts("LSP: Go to Reference"))

        vim.keymap.set("n", "<leader>,a", function() vim.lsp.buf.code_action() end, opts("LSP: Code Action"))
        vim.keymap.set("n", "<leader>,r", function() vim.lsp.buf.rename() end, opts("LSP: Rename"))
        vim.keymap.set("n", "<leader>,w", function() vim.lsp.buf.workspace_symbol() end, opts("LSP: Show Workspace Symbol"))
        vim.keymap.set("n", "<leader>,d", function() vim.diagnostic.open_float() end, opts("LSP: Show Diagnostics"))

        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts("LSP: Go to previous Diagnostic"))
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts("LSP: Go to next Diagnostic"))

        vim.keymap.set("n", "<leader>,s", function() vim.lsp.buf.signature_help() end, opts("LSP: Signature Help"))
    end)

    lsp.setup()
end
