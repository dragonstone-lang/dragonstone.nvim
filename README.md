<p align="center">
    <div align="center"> <img src="https://dragonstone-lang.org/_app/immutable/assets/dragonstone-logo-type.BtOzxUlb.png" width="500"/> </div>
</p>

# NeoVim Extension for the Dragonstone Programming Language
## dragonstone.nvim
This is the official NeoVim extension and provides support for the [Dragonstone programming language](https://github.com/Vallereya/dragonstone). If you run into any issues, please report them in the [issues](https://github.com/dragonstone-lang/dragonstone.nvim/issues) section.

## Features
- **Syntax Highlighting**: Syntax highlighting for Dragonstone.
- **File Type Detection**: Detection for `.ds`, `.eds`, and `.forge` files.
- **Smart Indentation**: Default 4-space indentation following Dragonstone conventions.
- **Comment Support**: Line (`#`) and block (`#[ ]#`) comment handling.
- **Auto-pairs**: Auto closing for brackets, quotes, and Dragonstone-specific pairs.
- **LSP Support**: LSP integration (optional).

## Requirements
#### Needed Dependencies:
- NeoVim >= 0.8.0
- [Dragonstone](https://github.com/Vallereya/dragonstone)

#### Optional Dependencies:
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) for LSP support.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) for auto-pairing.

## Installation
#### Using [Lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)

###### Basic Installation (Syntax Highlighting Only)
```lua
{
    'dragonstone-lang/dragonstone.nvim',
    ft = { 'dragonstone', 'dragonstone-embedded', 'dragonstone-forge' },
}
```

###### Full Installation with LSP and Auto-pairs
```lua
{
    'dragonstone-lang/dragonstone.nvim',
    ft = {
        'dragonstone',
        'dragonstone-embedded',
        'dragonstone-forge'
    },
    dependencies = {
        'neovim/nvim-lspconfig',
        'windwp/nvim-autopairs',
    },
    config = function()
        require('dragonstone').setup({
            lsp = {
                enabled = true,

                -- Adjust if your LSP command is different.
                cmd = {
                    'dragonstone',
                    'lsp'
                },
            },
            autopairs = {
                enabled = true,
            },
        })
    end,
}
```

#### Using [Packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use {
    'dragonstone-lang/dragonstone.nvim',
    ft = {
        'dragonstone',
        'dragonstone-embedded',
        'dragonstone-forge'
    },
    requires = {
        'neovim/nvim-lspconfig',
        'windwp/nvim-autopairs',
    },
    config = function()
        require('dragonstone').setup({
            lsp = {
                enabled = true
            },
            autopairs = {
                enabled = true
            },
        })
    end,
}
```

#### Using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'dragonstone-lang/dragonstone.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'windwp/nvim-autopairs'
```

Then in your `init.lua`:
```lua
require('dragonstone').setup({
    lsp = {
        enabled = true
    },
    autopairs = {
        enabled = true
    },
})
```

## Configuration
#### Full Configuration Example
```lua
require('dragonstone').setup({

    -- LSP Configuration.
    lsp = {
        enabled = true,
        cmd = {
            'dragonstone',
            'lsp'
        },
        settings = {
            -- Custom LSP settings here.
        },
    },

    -- Auto-pairs Configuration.
    autopairs = {
        enabled = true,
    },
})
```

#### Manual LSP Setup (Advanced)
If you prefer to configure the LSP manually via `nvim-lspconfig`:

```lua
require('dragonstone.lsp').setup_lspconfig()

require('lspconfig').dragonstone.setup({
    cmd = {
        'dragonstone',
        'lsp'
    },
    on_attach = your_on_attach_function,
    capabilities = your_capabilities,
})
```

## Features in Detail
#### Syntax Highlighting:
- Keywords and control flow.
- Types and built-in classes.
- Functions and methods.
- Comments (line and block).
- Strings and interpolation.
- Numbers (decimal, hex, octal, binary).
- Symbols and operators.
- Annotations and macros.
- Variables (instance, class, global).

#### Smart Indentation:
- 4 space indentation (configurable via `shiftwidth`).
- Automatic indentation after keywords: `class`, `module`, `def`, `if`, `case`, etc.
- Automatic de-indentation for `end`, `else`, `elsif`, etc.
- Bracket and annotation indenting.

#### Auto-pairs
Special Dragonstone pairs:
- Block comments: `#[...]#`.
- String interpolation: `#{...}`.
- Block parameters: `|...|`.
- Annotations: `@[...]`.
- Standard pairs for `(...)`, `[...]`, `{...}`, `"..."`, `'...'`.

## Troubleshooting
#### LSP Not Working:
1. Ensure the Dragonstone language server is installed and available in your PATH.
2. Check the LSP command is correct: `dragonstone lsp`.
3. Verify nvim-lspconfig is installed.
4. Check LSP status with `:LspInfo`.

#### Auto Pairs Not Working:
1. Ensure nvim-autopairs is installed and configured.
2. Make sure you've called `require('dragonstone').setup({ autopairs = { enabled = true } })`.
3. Auto-pairs integration is optional and will gracefully disable if nvim-autopairs is not available.

#### Syntax Highlighting Issues:
1. Run `:set filetype?` to verify the file is detected as `dragonstone`.
2. Try `:set syntax=dragonstone` manually.
3. Ensure your color scheme supports the highlight groups.

## Roadmap
As stated, this is minimal at the moment and will be extended as the language grows. These are some features that are planned or would be nice for the future:
- Better LSP.
- Better Completion.
- Better Detection.
- Add Debugger.

## Contributing
See [CONTRIBUTING](https://github.com/dragonstone-lang/dragonstone.nvim/blob/main/.github/CONTRIBUTING.md).

- [@Vallereya](https://github.com/Vallereya) - Creator/Maintainer

[See All Contributors](https://github.com/dragonstone-lang/dragonstone.nvim/graphs/contributors)

Thank You! 💜

---

<br>
<p align="center">
    <b>
        <code> © 2025<i><a href="https://github.com/vallereya"> Vallereya </a></i></code>
    </b>
</p>
<br>
<p align="center">
	<img
        src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true"
    />
</p>
<div align="center">
    <p>
        <i>
            Code and Contributions have
            <b><i>MIT License</i></b>
            <br>
            See <b>LICENSE</b> for more information.
        </i>
    </p>
    <br>
    <a href="https://github.com/dragonstone-lang/dragonstone.nvim/blob/main/LICENSE">
        <img
            src="https://img.shields.io/github/license/vallereya/dragonstone.nvim?style=for-the-badge&logoColor=CDD6F4&labelColor=302D41&color=CBA6F7"
            alt="LICENSE"
        >
        </img>
    </a>
</div>
