-- Dragonstone autopairs configuration
-- Author: Vallereya
-- URL: https://github.com/dragonstone-lang/dragonstone.nvim

local M = {}

-- Setup autopairs for Dragonstone.
function M.setup()
    -- Check if nvim-autopairs is available.
    local ok, autopairs = pcall(require, "nvim-autopairs")
    if not ok then
        -- Silent return since autopairs is optional.
        return
    end

    -- Get the autopairs rule module.
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    -- Add Dragonstone-specific rules.
    local rules = {
        -- Auto-close block comments `#[...]#`.
        Rule("#[", "]#", {
            "dragonstone",
            "dragonstone-embedded",
            "dragonstone-forge"
        })
            :with_pair(cond.not_after_regex("%%"))
            :with_move(function(opts)
                return opts.char == "]"
            end),

        -- Auto-close string interpolation `#{...}`.
        Rule("#{", "}", {
            "dragonstone",
            "dragonstone-embedded",
            "dragonstone-forge"
        })
            :with_pair(cond.not_after_regex("%%"))
            :only_cr(function()
                return false
            end),

        -- Auto-close block parameters `|...|`.
        Rule("|", "|", {
            "dragonstone",
            "dragonstone-embedded",
            "dragonstone-forge"
        })
            :with_pair(function(opts)
                -- Only auto-close after `do` or `{`.
                local line = opts.line
                return line:match("do%s*|$") or line:match("{%s*|$")
            end)
            :with_move(function(opts)
                return opts.char == "|"
            end),

        -- Auto-close annotations `@[...]`.
        Rule("@[", "]", {
            "dragonstone",
            "dragonstone-embedded",
            "dragonstone-forge"
        })
            :with_pair(cond.not_after_regex("%%"))
            :with_move(function(opts)
                return opts.char == "]"
            end),
    }

    -- Add all rules to autopairs.
    for _, rule in ipairs(rules) do
        autopairs.add_rule(rule)
    end
end

return M
