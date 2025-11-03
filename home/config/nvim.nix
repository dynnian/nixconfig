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
        window = {
          width = 30;
        };
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
    ];

    # Key mappings
    globals.mapleader = " ";
    
    keymaps = [
      # Neo-tree toggle (replaces NERDTree keybindings)
      {
        mode = "n";
        key = "<C-b>";
        action = ":Neotree toggle<CR>";
        options = {
          silent = true;
          desc = "Toggle Neo-tree";
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree toggle<CR>";
        options = {
          silent = true;
          desc = "Toggle Neo-tree";
        };
      }
      # Faster scrolling
      {
        mode = "n";
        key = "<S-Up>";
        action = "5k";
      }
      {
        mode = "n";
        key = "<S-Down>";
        action = "5j";
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
