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

    # Enable syntax highlighting and filetype detection
    filetype = {
      indent = true;
      plugin = true;
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
      # CoC (Conquer of Completion)
      coc = {
        enable = true;
        settings = {
          # CoC will auto-detect coc-go, coc-css, etc. if installed globally
          # or you can configure them here
        };
      };

      # NERDTree file browser
      nerdtree = {
        enable = true;
      };

      # Language support plugins
      # Note: vim-devicons is included with nerdtree support in nixvim
    };

    # Extra plugins not directly supported by nixvim
    extraPlugins = with pkgs.vimPlugins; [
      vim-devicons
      vim-nix
      coc-go
      vim-javascript
      coc-css
      coc-emmet
      coc-html
      coc-json
    ];

    # Key mappings
    globals.mapleader = " ";
    
    keymaps = [
      # NERDTree toggle
      {
        mode = "n";
        key = "<C-b>";
        action = ":NERDTreeToggle<CR>";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":NERDTreeToggle<CR>";
        options = {
          silent = true;
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

    # Additional VimScript configuration
    extraConfigVim = ''
      " NERDTree settings
      let g:NERDTreeShowHidden = 1
      let g:NERDTreeMinimalUI = 1
      let g:NERDTreeIgnore = []
      let g:NERDTreeStatusline = ""
      highlight NERDTreeCWD ctermfg=white

      " Exit Vim if NERDTree is the only window
      autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

      " Transparent background highlights
      hi Normal      guibg=NONE ctermbg=NONE
      hi LineNr      guibg=NONE ctermbg=NONE
      hi SignColumn  guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi Visual      cterm=none ctermbg=darkgrey ctermfg=white
    '';

    # Autocommands for 2-space indentation
    autoCmd = [
      {
        event = [ "FileType" ];
        pattern = [ "json" "nix" ];
        command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2";
      }
    ];
  };
}
