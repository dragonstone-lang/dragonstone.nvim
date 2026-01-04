-- Dragonstone LSP configuration
-- Author: Vallereya
-- URL: https://github.com/dragonstone-lang/dragonstone.nvim

---@diagnostic disable-next-line: undefined-global
local vim = vim

local M = {}

-- Default LSP configuration.
M.default_config = {
    cmd = {
        "dragonstone",
        "lsp"
    },
    filetypes = {
        "dragonstone",
        "dragonstone-embedded",
        "dragonstone-forge"
    },
    root_dir = function(fname)
        local util = require("lspconfig.util")
        return util.root_pattern("shard.yml", ".git")(fname) or util.path.dirname(fname)
    end,
    settings = {},
}

-- Setup LSP using nvim-lspconfig.
function M.setup(opts)
    opts = opts or {}

    -- Check if lspconfig is available.
    local ok, lspconfig = pcall(require, "lspconfig")
    if not ok then
        vim.notify(
            "nvim-lspconfig is required for Dragonstone LSP support. Install it with your plugin manager.",
            vim.log.levels.WARN
        )
        return
    end

    -- Merge user config with defaults.
    local config = vim.tbl_deep_extend("force", M.default_config, opts)

    -- Register the dragonstone LSP server if not already registered.
    local configs = require("lspconfig.configs")
    if not configs.dragonstone then
        configs.dragonstone = {
            default_config = config,
        }
    end

    -- Setup the LSP server.
    lspconfig.dragonstone.setup(config)
end

-- Manual setup for users who want to configure via lspconfig directly.
function M.setup_lspconfig()
    local configs = require("lspconfig.configs")

    if not configs.dragonstone then
        configs.dragonstone = {
            default_config = M.default_config,
        }
    end
end

return M
