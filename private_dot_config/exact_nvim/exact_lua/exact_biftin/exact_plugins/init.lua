-- Initialize lazy.nvim Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Color Theme
    {
        "rose-pine/neovim",
        priority = 1000,
        opts = {
            disable_background = true
        },
        config = function(_, opts)
            require("rose-pine").setup(opts)
            vim.cmd.colorscheme("rose-pine")
        end,
    },

    -- TreeSitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = "all",
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",

    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.api.nvim_command, "MasonUpdate")
                end,
            },
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",

            -- Snippets
            "L3MON4D3/LuaSnip",
        },
        config = require("biftin.plugins.lsp"),
    },

    -- UI
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = function()
            local function builtin()
                return require("telescope.builtin")
            end

            return {
                { "<leader>pf", function() builtin().find_files() end, desc = "Telescope: Find Files" },
                { "<C-p>", function() builtin().git_files() end, desc = "Telescope: Find Git Files" },
                {
                    "<leader>ps",
                    function()
                        builtin().grep_string({ search = vim.fn.input("Grep > ") })
                    end,
                    desc = "Telescope: Grep over Files"
                },
                { "<leader>h", function() builtin().help_tags() end, desc = "Telescope: Help Tags" },
            }
        end,
    },
    {
        "ThePrimeagen/harpoon",
        keys = function()
            local function mark()
                return require("harpoon.mark")
            end

            local function ui()
                return require("harpoon.ui")
            end

            return {
                { "<leader>a", function() mark().add_file() end, desc = "Harpoon: Add File" },
                { "<C-e>", function() ui().toggle_quick_menu() end, desc = "Harpoon: Toggle Quick Menu" },

                { "<C-h>", function() ui().nav_file(1) end, desc = "Harpoon: Navigate to 1" },
                { "<C-j>", function() ui().nav_file(2) end, desc = "Harpoon: Navigate to 2" },
                { "<C-k>", function() ui().nav_file(3) end, desc = "Harpoon: Navigate to 3" },
                { "<C-l>", function() ui().nav_file(4) end, desc = "Harpoon: Navigate to 4" },
            }
        end,
    },
    {
        "folke/trouble.nvim",
        opts = {
            icons = false,
            fold_open = "v",
            fold_closed = ">",
            indent_lines = false,
            signs = {
                error = "error",
                warning = "warn",
                hint = "hint",
                information = "info",
            },
            use_diagnostic_signs = false,
        },
        keys = function()
            local function trouble()
                return require("trouble")
            end

            return {
                { "<leader>xx", function() trouble().open() end, desc = "Trouble: Open" },
                { "<leader>xw", function() trouble().open("workspace_diagnostics") end, desc = "Trouble: Open Workspace Diagnostics" },
                { "<leader>xd", function() trouble().open("document_diagnostics") end, desc = "Trouble: Open Document Diagnostics" },
                { "<leader>xl", function() trouble().open("quickfix") end, desc = "Trouble: Open Quickfix" },
                { "<leader>xq", function() trouble().open("loclist") end, desc = "Trouble: Open Location List" },
                { "gR", function() trouble().open("lsp_references") end, desc = "Trouble: Open LSP References" },
            }
        end,
    }
})
