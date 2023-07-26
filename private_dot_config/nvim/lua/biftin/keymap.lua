-- Leader Key
vim.g.mapleader = " "

-- Keybindings
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc="Open Netrw File Browser"})

vim.keymap.set("n", "Q", "<nop>", {desc="Disable Q"})

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, {desc="Source Config File"})
