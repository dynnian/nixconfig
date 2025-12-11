{ config, pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    # Basic editor settings
    opts = {
      number = true;
      clipboard = "unnamedplus";
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      smarttab = true;
      shell = "${pkgs.bashInteractive}/bin/bash";
      shellcmdflag = "-i -c";
    };

    # Colorscheme
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };

    # Plugins (Nixvim modules)
    plugins = {
      # Neo-tree file browser (modern replacement for NERDTree)
      neo-tree = {
        enable = true;
        settings = {
          close_if_last_window = true;
          window = { width = 30; };
          filesystem = {
            filtered_items = {
              hide_dotfiles = false;
              hide_gitignored = false;
            };
          };
        };
      };

      # Web devicons for neo-tree
      web-devicons.enable = true;
    };

    # Extra plugins not directly supported by nixvim
    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      vim-javascript

      # Native LSP + auto-install stack
      nvim-lspconfig
      mason-nvim
      mason-lspconfig-nvim

      # Completion + snippets
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      LuaSnip
      cmp_luasnip
      friendly-snippets

      # Terminal emulator
      toggleterm-nvim
    ];

    # Key mappings
    globals.mapleader = " ";
    keymaps = [
      # Neo-tree toggles
      {
        mode = "n";
        key = "<C-b>";
        action = ":Neotree toggle<CR>";
        options = { silent = true; desc = "Toggle Neo-tree"; };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree toggle<CR>";
        options = { silent = true; desc = "Toggle Neo-tree"; };
      }

      # Toggle floating terminal
      {
        mode = "n";
        key = "<leader>t";
        action = ":ToggleTerm direction=float<CR>";
        options = { silent = true; desc = "Toggle terminal (float)"; };
      }

      # Faster scrolling
      { mode = "n"; key = "<S-Up>";   action = "5k"; }
      { mode = "n"; key = "<S-Down>"; action = "5j"; }

      # Terminal-mode: Esc to normal-mode
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        options = { silent = true; desc = "Exit terminal mode"; };
      }
      # Optional: navigate splits from terminal-mode
      {
        mode = "t";
        key = "<C-h>";
        action = "<C-\\><C-n><C-w>h";
        options = { silent = true; };
      }
      {
        mode = "t";
        key = "<C-j>";
        action = "<C-\\><C-n><C-w>j";
        options = { silent = true; };
      }
      {
        mode = "t";
        key = "<C-k>";
        action = "<C-\\><C-n><C-w>k";
        options = { silent = true; };
      }
      {
        mode = "t";
        key = "<C-l>";
        action = "<C-\\><C-n><C-w>l";
        options = { silent = true; };
      }
    ];

    # Additional Lua configuration
    extraConfigLua = ''
      -----------------------------------------------------------------------
      -- Mason: manage LSP servers (automatic download, like LunarVim)
      -----------------------------------------------------------------------
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      mason.setup()

      mason_lspconfig.setup({
        ensure_installed = {
          "csharp_ls",   -- C#
          "jsonls",
          "html",
          "cssls",
          "lua_ls"
        },
      })

      -----------------------------------------------------------------------
      -- nvim-cmp + LuaSnip: completion + snippets
      -----------------------------------------------------------------------
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load VSCode-style snippets (from friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -----------------------------------------------------------------------
      -- LSP setup: capabilities + on_attach + automatic server setup
      -----------------------------------------------------------------------
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local bufmap = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
        end

        bufmap("n", "K", vim.lsp.buf.hover)
        bufmap("n", "gd", vim.lsp.buf.definition)
        bufmap("n", "gr", vim.lsp.buf.references)
        bufmap("n", "gi", vim.lsp.buf.implementation)
        bufmap("n", "<leader>rn", vim.lsp.buf.rename)
        bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
      end

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
      })

      -----------------------------------------------------------------------
      -- Transparent background highlights
      -----------------------------------------------------------------------
      vim.cmd([[
        hi Normal      guibg=NONE ctermbg=NONE
        hi LineNr      guibg=NONE ctermbg=NONE
        hi SignColumn  guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
        hi Visual      cterm=none ctermbg=darkgrey ctermfg=white
      ]])

      -----------------------------------------------------------------------
      -- toggleterm setup
      -----------------------------------------------------------------------
      require("toggleterm").setup({
        size = 14,
        hide_numbers = true,
        shade_terminals = false,
        start_in_insert = true,
        insert_mappings = false,
        direction = "float",
        float_opts = { border = "rounded", winblend = 0 },
      })
    '';

    # Autocommands for 2-space indentation and filetype plugin/indent
    autoCmd = [
      {
        event = [ "FileType" ];
        pattern = [ "json" "nix" ];
        command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2";
      }
    ];

    # Additional VimScript configuration for filetype plugin indent
    extraConfigVim = ''
      filetype plugin indent on
    '';
  };
}
