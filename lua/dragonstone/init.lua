-- Main Dragonstone plugin module
-- Author: Vallereya
-- URL: https://github.com/dragonstone-lang/dragonstone.nvim

---@diagnostic disable-next-line: undefined-global
local vim = vim

local M = {}

-- Setup function that can be called from user's config.
function M.setup(opts)
    opts = opts or {}

    -- Default configuration.
    local config = {
        lsp = {
            enabled     = opts.lsp and opts.lsp.enabled or false,
            cmd         = opts.lsp and opts.lsp.cmd or { "dragonstone", "lsp" },
            settings    = opts.lsp and opts.lsp.settings or {},
        },
        autopairs = {
            enabled     = opts.autopairs and opts.autopairs.enabled or true,
        },
    }

    -- Store config globally for other modules.
    _G.dragonstone_config = config

    -- Setup LSP if enabled.
    if config.lsp.enabled then
        local ok, lsp = pcall(require, "dragonstone.lsp")
        if ok then
            lsp.setup(config.lsp)
        else
            vim.notify("Failed to load dragonstone LSP module", vim.log.levels.WARN)
        end
    end

    -- Setup autopairs if enabled.
    if config.autopairs.enabled then
        local ok, autopairs = pcall(require, "dragonstone.autopairs")
        if ok then
            autopairs.setup()
        end
    end
end

return M
