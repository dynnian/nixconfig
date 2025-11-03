{ config, pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    # <-- use `opts`, not `options`
    opts = {
      number = true;
      clipboard = "unnamedplus";

      # default: spaces, 4-wide
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
    };

    # plugins
    plugins = {
      # Catppuccin Mocha (either colorscheme or plugin module both work)
      catppuccin = {
        enable = true;
        settings = {
          flavour = "mocha";
          transparent_background = true;
        };
      };

      # NERDTree + icons (NERDTree works best with *vim-devicons*)
      nerdtree.enable = true;
      vim-devicons.enable = true;

      treesitter = {
        enable = true;
        ensureInstalled = [ "lua" "json" "nix" "bash" "vim" "markdown" ];
      };
    };

    # extra lua
    extraLuaConfig = ''
      vim.g.mapleader = " "
      vim.keymap.set("n", "<leader>e", ":NERDTreeToggle<CR>", { silent = true })
      vim.keymap.set("n", "<C-b>",     ":NERDTreeToggle<CR>", { silent = true })

      -- 2-space indent for JSON and Nix
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "json", "nix" },
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.softtabstop = 2
        end
      })

      vim.cmd.colorscheme("catppuccin")

      -- optional transparent tweaks
      vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNr",      { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn",  { bg = "none" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    '';
  };
}
