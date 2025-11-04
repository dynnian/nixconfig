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

    # Plugins
    plugins = {
      # Neo-tree file browser (modern replacement for NERDTree)
      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
        window = { width = 30; };
        filesystem = {
          filteredItems = {
            hideDotfiles = false;
            hideGitignored = false;
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
      # CoC and extensions
      coc-nvim
      coc-go
      coc-css
      coc-emmet
      coc-html
      coc-json

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
      -- Transparent background highlights
      vim.cmd([[
        hi Normal      guibg=NONE ctermbg=NONE
        hi LineNr      guibg=NONE ctermbg=NONE
        hi SignColumn  guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
        hi Visual      cterm=none ctermbg=darkgrey ctermfg=white
      ]])

      -- toggleterm setup
      require("toggleterm").setup({
        size = 14,
        open_mapping = [[<leader>t]], -- also mapped above to ensure it works
        hide_numbers = true,
        shade_terminals = false,
        start_in_insert = true,
        insert_mappings = true,
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
