{ inputs, config, pkgs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;

    # Core editor options
    options = {
      number = true;
      clipboard = "unnamedplus";

      # Default indentation: spaces, 4-wide
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
    };

    # Plugins
    plugins = {
      # Theme: Catppuccin Mocha
      catppuccin = {
        enable = true;
        settings = {
          flavour = "mocha";
          transparent_background = true; # optional
        };
      };

      # File tree and icons
      nerdtree.enable = true;
      webdevicons.enable = true;

      # Recommended: Treesitter
      treesitter = {
        enable = true;
        ensureInstalled = [ "lua" "json" "nix" "bash" "vim" "markdown" ];
      };

      # If you want CoC later:
      # coc-nvim.enable = true;
    };

    # Extra Lua for keymaps & per-filetype indent
    extraLuaConfig = ''
      -- Leader key
      vim.g.mapleader = " "

      -- NERDTree toggle: <Space>e and Ctrl-b
      vim.keymap.set("n", "<leader>e", ":NERDTreeToggle<CR>", { silent = true })
      vim.keymap.set("n", "<C-b>",     ":NERDTreeToggle<CR>", { silent = true })

      -- Use 2 spaces for JSON and Nix
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "json", "nix" },
        callback = function()
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.softtabstop = 2
        end
      })

      -- Apply colorscheme after setup
      vim.cmd.colorscheme("catppuccin")

      -- (Optional) transparent tweaks
      vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
      vim.api.nvim_set_hl(0, "LineNr",      { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn",  { bg = "none" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    '';
  };
}
