{ pkgs, ... }: {
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
      shell = "fish";
      shellcmdflag = "-i -c";
      fillchars = { eob = " "; };
    };

    # Colorscheme
    colorschemes.gruvbox = {
      enable = true;
      settings = {
        undercurl = true;
        underline = true;
        bold = true;
        italic = {
          strings = true;
          emphasis = true;
          comments = true;
          operators = false;
          folds = true;
        };
        strikethrough = true;
        invert_selection = false;
        invert_signs = false;
        invert_tabline = false;
        inverse = true;
        dim_inactive = false;
        transparent_mode = false;
      };
    };

    # Plugins
    plugins = {
      gitsings.enable = true;
      neogit.enable = true;
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

      web-devicons.enable = true;

      # LSP
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          nixd.enable   = true;
          lua_ls.enable = true;
          csharp_ls.enable = true;
          gopls.enable = true;
          rust_analyzer = { 
            enable = true; 
            installCargo = false;
            installRustc = false;
          };
        };
      };

      # Completion engine (nvim-cmp)
      cmp = {
        enable = true;
        # we’ll configure cmp via Lua below, so leave this on default.
        autoEnableSources = false;
      };

      # Completion SOURCES (these are separate plugins)
      "cmp-nvim-lsp".enable = true;
      "cmp-buffer".enable   = true;
      "cmp-path".enable     = true;
      "cmp_luasnip".enable  = true;

      # Snippets
      luasnip.enable           = true;
      friendly-snippets.enable = true;

      # Which key
      which-key = {
        enable = true;
        settings = {
          delay = 300;
          win = {
            border = "rounded";
          };
          plugins = {
            marks = true;
            registers = true;
            spelling = { enabled = true; suggestions = 20; };
            presets = {
              operators = true;
              motions = true;
              text_objects = true;
              windows = true;
              nav = true;
              z = true;
              g = true;
            };
          };
        };
      };

      # Telescope
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          project = {
            enable = true;
            settings = {
              base_dirs = [
                { path = "~/Development"; max_depth = 4; }
                { path = "~/src"; max_depth = 4; }
                { path = "~/dev"; max_depth = 4; }
              ];
              hidden_files = true;
              order_by = "asc";
              search_by = "title";
              sync_with_nvim_tree = true;
              theme = "dropdown";
              ignore_missing_dirs = true;
              on_project_selected.__raw = ''
                function(prompt_bufnr)
                  local project_actions =
                    require("telescope._extensions.project.actions")

                  project_actions.change_working_directory(prompt_bufnr, false)
                end
              '';

              mappings = {
                n = {
                  d.__raw = "require('telescope._extensions.project.actions').delete_project";
                  r.__raw = "require('telescope._extensions.project.actions').rename_project";
                  c.__raw = "require('telescope._extensions.project.actions').add_project";
                  C.__raw = "require('telescope._extensions.project.actions').add_project_cwd";
                  f.__raw = "require('telescope._extensions.project.actions').find_project_files";
                  b.__raw = "require('telescope._extensions.project.actions').browse_project_files";
                  s.__raw = "require('telescope._extensions.project.actions').search_in_project_files";
                  R.__raw = "require('telescope._extensions.project.actions').recent_project_files";
                  w.__raw = "require('telescope._extensions.project.actions').change_working_directory";
                  o.__raw = "require('telescope._extensions.project.actions').next_cd_scope";
                };

                i = {
                  "<c-d>".__raw = "require('telescope._extensions.project.actions').delete_project";
                  "<c-v>".__raw = "require('telescope._extensions.project.actions').rename_project";
                  "<c-a>".__raw = "require('telescope._extensions.project.actions').add_project";
                  "<c-A>".__raw = "require('telescope._extensions.project.actions').add_project_cwd";
                  "<c-f>".__raw = "require('telescope._extensions.project.actions').find_project_files";
                  "<c-b>".__raw = "require('telescope._extensions.project.actions').browse_project_files";
                  "<c-s>".__raw = "require('telescope._extensions.project.actions').search_in_project_files";
                  "<c-r>".__raw = "require('telescope._extensions.project.actions').recent_project_files";
                  "<c-l>".__raw = "require('telescope._extensions.project.actions').change_working_directory";
                  "<c-o>".__raw = "require('telescope._extensions.project.actions').next_cd_scope";
                };
              };
            };
          };
        };
        settings = {
          defaults = {
            prompt_prefix = " ";
            selection_caret = "❯ ";
            path_display = [ "smart" ];
            sorting_strategy = "ascending";
            layout_config = {
              prompt_position = "top";
            };
          };
          pickers = {
            find_files = {
              hidden = true;
            };
          };
        };
      };

      # Dashboard
      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          change_to_vcs_root = true;
          hide = {
            statusline = true;
            tabline = true;
            winbar = true;
          };
          config = {
            week_header.enable = false;
            vertical_center = true;
            footer = [
              "vi veri veniversum vivus vici"
            ];
            header = [
              "                                                  "
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣤⡼⠀⢀⡀⣀⢱⡄⡀⠀⠀⠀⢲⣤⣤⣤⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⡿⠛⠋⠁⣤⣿⣿⣿⣧⣷⠀⠀⠘⠉⠛⢻⣷⣿⣽⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⢀⣴⣞⣽⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠠⣿⣿⡟⢻⣿⣿⣇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣟⢦⡀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⣠⣿⡾⣿⣿⣿⣿⣿⠿⣻⣿⣿⡀⠀⠀⠀⢻⣿⣷⡀⠻⣧⣿⠆⠀⠀⠀⠀⣿⣿⣿⡻⣿⣿⣿⣿⣿⠿⣽⣦⡀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⣼⠟⣩⣾⣿⣿⣿⢟⣵⣾⣿⣿⣿⣧⠀⠀⠀⠈⠿⣿⣿⣷⣈⠁⠀⠀⠀⠀⣰⣿⣿⣿⣿⣮⣟⢯⣿⣿⣷⣬⡻⣷⡄⠀⠀⠀"
              "⠀⠀⢀⡜⣡⣾⣿⢿⣿⣿⣿⣿⣿⢟⣵⣿⣿⣿⣷⣄⠀⣰⣿⣿⣿⣿⣿⣷⣄⠀⢀⣼⣿⣿⣿⣷⡹⣿⣿⣿⣿⣿⣿⢿⣿⣮⡳⡄⠀⠀"
              "⠀⢠⢟⣿⡿⠋⣠⣾⢿⣿⣿⠟⢃⣾⢟⣿⢿⣿⣿⣿⣾⡿⠟⠻⣿⣻⣿⣏⠻⣿⣾⣿⣿⣿⣿⡛⣿⡌⠻⣿⣿⡿⣿⣦⡙⢿⣿⡝⣆⠀"
              "⠀⢯⣿⠏⣠⠞⠋⠀⣠⡿⠋⢀⣿⠁⢸⡏⣿⠿⣿⣿⠃⢠⣴⣾⣿⣿⣿⡟⠀⠘⢹⣿⠟⣿⣾⣷⠈⣿⡄⠘⢿⣦⠀⠈⠻⣆⠙⣿⣜⠆"
              "⢀⣿⠃⡴⠃⢀⡠⠞⠋⠀⠀⠼⠋⠀⠸⡇⠻⠀⠈⠃⠀⣧⢋⣼⣿⣿⣿⣷⣆⠀⠈⠁⠀⠟⠁⡟⠀⠈⠻⠀⠀⠉⠳⢦⡀⠈⢣⠈⢿⡄"
              "⣸⠇⢠⣷⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠿⠿⠋⠀⢻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢾⣆⠈⣷"
              "⡟⠀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣤⡀⢸⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⢹"
              "⡇⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠈⣿⣼⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⢸"
              "⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠶⣶⡟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼"
              "⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡁⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣼⣀⣠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "                                                  "
            ];
            center = [
              {
                icon = " ";
                icon_hl = "@variable";
                desc = "Find files";
                desc_hl = "String";
                key = "f";
                key_hl = "Number";
                action = "Telescope find_files";
              }
              {
                icon = " ";
                icon_hl = "@variable";
                desc = "Recent files";
                desc_hl = "String";
                key = "r";
                key_hl = "Number";
                action = "Telescope oldfiles";
              }
              {
                icon = " ";
                icon_hl = "@variable";
                desc = "Projects";
                desc_hl = "String";
                key = "p";
                key_hl = "Number";
                action = "Telescope project";
              }
              {
                icon = " ";
                icon_hl = "@variable";
                desc = "Quit";
                desc_hl = "String";
                key = "q";
                key_hl = "Number";
                action = "qa";
              }
            ];
          };
        };
      };
    };

    # Extra plugins (not covered by nixvim modules)
    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      vim-javascript
      toggleterm-nvim
    ];

    # Keymaps
    globals.mapleader = " ";
    keymaps = [
      ## Doom-style window management (SPC w …)
      {
        mode = "n";
        key = "<leader>wh";
        action = "<C-w>h";
        options = { silent = true; desc = "Window left"; };
      }
      {
        mode = "n";
        key = "<leader>wj";
        action = "<C-w>j";
        options = { silent = true; desc = "Window down"; };
      }
      {
        mode = "n";
        key = "<leader>wk";
        action = "<C-w>k";
        options = { silent = true; desc = "Window up"; };
      }
      {
        mode = "n";
        key = "<leader>wl";
        action = "<C-w>l";
        options = { silent = true; desc = "Window right"; };
      }
      
      # Splits
      {
        mode = "n";
        key = "<leader>wv";
        action = "<C-w>v";
        options = { silent = true; desc = "Vertical split"; };
      }
      {
        mode = "n";
        key = "<leader>ws";
        action = "<C-w>s";
        options = { silent = true; desc = "Horizontal split"; };
      }
      
      # Close / maximize
      {
        mode = "n";
        key = "<leader>wc";
        action = "<C-w>c";
        options = { silent = true; desc = "Close window"; };
      }
      {
        mode = "n";
        key = "<leader>wo";
        action = "<C-w>o";
        options = { silent = true; desc = "Only window"; };
      }

      ## LSP (Doom-ish: <leader>l ...)
      # Jump / navigation (classic)
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        options = { silent = true; desc = "LSP: go to definition"; };
      }
      {
        mode = "n";
        key = "gD";
        action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
        options = { silent = true; desc = "LSP: go to declaration"; };
      }
      {
        mode = "n";
        key = "gI";
        action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
        options = { silent = true; desc = "LSP: go to implementation"; };
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
        options = { silent = true; desc = "LSP: references"; };
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        options = { silent = true; desc = "LSP: hover"; };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
        options = { silent = true; desc = "LSP: signature help"; };
      }
      
      # Leader LSP actions
      {
        mode = "n";
        key = "<leader>la";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options = { silent = true; desc = "LSP: code action"; };
      }
      {
        mode = "n";
        key = "<leader>lr";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        options = { silent = true; desc = "LSP: rename"; };
      }
      {
        mode = "n";
        key = "<leader>lf";
        action = "<cmd>lua vim.lsp.buf.format({ async = true })<CR>";
        options = { silent = true; desc = "LSP: format"; };
      }
      {
        mode = "n";
        key = "<leader>ld";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        options = { silent = true; desc = "Diagnostics: line"; };
      }
      {
        mode = "n";
        key = "<leader>lq";
        action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
        options = { silent = true; desc = "Diagnostics: loclist"; };
      }
      {
        mode = "n";
        key = "<leader>lQ";
        action = "<cmd>lua vim.diagnostic.setqflist()<CR>";
        options = { silent = true; desc = "Diagnostics: quickfix"; };
      }
      
      # Diagnostics navigation
      {
        mode = "n";
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        options = { silent = true; desc = "Diagnostics: previous"; };
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        options = { silent = true; desc = "Diagnostics: next"; };
      }
      
      # Symbols (use built-in LSP, you already have Telescope ones too)
      {
        mode = "n";
        key = "<leader>ls";
        action = "<cmd>lua vim.lsp.buf.document_symbol()<CR>";
        options = { silent = true; desc = "LSP: document symbols"; };
      }
      {
        mode = "n";
        key = "<leader>lS";
        action = "<cmd>lua vim.lsp.buf.workspace_symbol('')<CR>";
        options = { silent = true; desc = "LSP: workspace symbols"; };
      }
      
      # LSP info / restart
      {
        mode = "n";
        key = "<leader>li";
        action = "<cmd>LspInfo<CR>";
        options = { silent = true; desc = "LSP: info"; };
      }
      {
        mode = "n";
        key = "<leader>lR";
        action = "<cmd>LspRestart<CR>";
        options = { silent = true; desc = "LSP: restart"; };
      }

      ## Git (SPC g ...)
      {
        mode = "n";
        key = "<leader>gg";
        action = ":Neogit<CR>";
        options = { silent = true; desc = "Git: status (Neogit)"; };
      }

      # Commit (open Neogit commit popup)
      {
        mode = "n";
        key = "<leader>gc";
        action = "<cmd>lua require('neogit').open({ kind = 'tab' }); vim.cmd('Neogit commit')<CR>";
        options = { silent = true; desc = "Git: commit"; };
      }
      
      # Push (open Neogit push popup)
      {
        mode = "n";
        key = "<leader>gp";
        action = "<cmd>lua require('neogit').open({ kind = 'tab' }); vim.cmd('Neogit push')<CR>";
        options = { silent = true; desc = "Git: push"; };
      }
      
      # Hunks
      {
        mode = "n";
        key = "<leader>gh";
        action = ":Gitsigns preview_hunk<CR>";
        options = { silent = true; desc = "Preview hunk"; };
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = ":Gitsigns stage_hunk<CR>";
        options = { silent = true; desc = "Stage hunk"; };
      }
      {
        mode = "n";
        key = "<leader>gr";
        action = ":Gitsigns reset_hunk<CR>";
        options = { silent = true; desc = "Reset hunk"; };
      }
      
      # File-level
      {
        mode = "n";
        key = "<leader>gS";
        action = ":Gitsigns stage_buffer<CR>";
        options = { silent = true; desc = "Stage buffer"; };
      }
      {
        mode = "n";
        key = "<leader>gR";
        action = ":Gitsigns reset_buffer<CR>";
        options = { silent = true; desc = "Reset buffer"; };
      }
      
      # Navigation
      {
        mode = "n";
        key = "]c";
        action = ":Gitsigns next_hunk<CR>";
        options = { silent = true; desc = "Next hunk"; };
      }
      {
        mode = "n";
        key = "[c";
        action = ":Gitsigns prev_hunk<CR>";
        options = { silent = true; desc = "Previous hunk"; };
      }
      
      # Blame
      {
        mode = "n";
        key = "<leader>gb";
        action = ":Gitsigns blame_line<CR>";
        options = { silent = true; desc = "Blame line"; };
      }

      ## Neotree
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

      ## Toggleterm
      {
        mode = "n";
        key = "<leader>t";
        action = ":ToggleTerm direction=float<CR>";
        options = { silent = true; desc = "Toggle terminal (float)"; };
      }
      { mode = "n"; key = "<S-Up>";   action = "5k"; }
      { mode = "n"; key = "<S-Down>"; action = "5j"; }
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        options = { silent = true; desc = "Exit terminal mode"; };
      }
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

      ## Telescope
      {
        mode = "n";
        key = "<leader>of";
        action = ":Telescope find_files<CR>";
        options = { silent = true; desc = "Open file"; };
      }
      {
        mode = "n";
        key = "<leader>or";
        action = ":Telescope oldfiles<CR>";
        options = { silent = true; desc = "Open recent file"; };
      }
      {
        mode = "n";
        key = "<leader>op";
        action = ":Telescope project<CR>";
        options = { silent = true; desc = "Open project"; };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = ":Telescope live_grep<CR>";
        options = { silent = true; desc = "Live grep"; };
      }
      {
        mode = "n";
        key = "<leader>bi";
        action = ":Telescope buffers<CR>";
        options = { silent = true; desc = "Buffers interactive"; };
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = ":Telescope help_tags<CR>";
        options = { silent = true; desc = "Help tags"; };
      }
      {
        mode = "n";
        key = "<leader>fs";
        action = ":Telescope lsp_document_symbols<CR>";
        options = { silent = true; desc = "Document symbols"; };
      }
      {
        mode = "n";
        key = "<leader>fS";
        action = ":Telescope lsp_workspace_symbols<CR>";
        options = { silent = true; desc = "Workspace symbols"; };
      }
      {
        mode = "n";
        key = "<leader>/";
        action = ":Telescope current_buffer_fuzzy_find<CR>";
        options = { silent = true; desc = "Fuzzy find in buffer"; };
      }

      ## Buffer mappings
      {
        mode = "n";
        key = "<leader>bn";
        action = ":bn";
        options = { silent = true; desc = "Next buffer"; };
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = ":bp";
        options = { silent = true; desc = "Previous buffer"; };
      }
    ];

    # Lua config (cmp + luasnip + toggleterm)
    extraConfigLua = ''
      --------------------------------------------------
      -- Transparent background highlights
      --------------------------------------------------
      vim.cmd([[
        hi Normal      guibg=NONE ctermbg=NONE
        hi LineNr      guibg=NONE ctermbg=NONE
        hi SignColumn  guibg=NONE ctermbg=NONE
        hi EndOfBuffer guibg=NONE ctermbg=NONE
        hi Visual      cterm=none ctermbg=darkgrey ctermfg=white
      ]])

      --------------------------------------------------
      -- toggleterm setup
      --------------------------------------------------
      require("toggleterm").setup({
        size = 14,
        hide_numbers = true,
        shade_terminals = false,
        start_in_insert = true,
        insert_mappings = false,
        direction = "float",
        float_opts = { border = "rounded", winblend = 0 },
      })

      --------------------------------------------------
      -- which key
      --------------------------------------------------
      pcall(function()
        local wk = require("which-key")
        wk.add({
          { "<leader>b", group = "Buffers" },
          { "<leader>e", group = "Explorer" },
          { "<leader>f", group = "Find" },
          { "<leader>g", group = "Git" },
          { "<leader>l", group = "LSP" },
          { "<leader>o", group = "Open" },
          { "<leader>q", group = "Quit/Session" },
          { "<leader>t", group = "Terminal" },
          { "<leader>w", group = "Windows" },
          { "<leader>x", group = "Diagnostics" },
        })
      end)

      --------------------------------------------------
      -- nvim-cmp + LuaSnip setup
      --------------------------------------------------
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load VSCode-style snippets (friendly-snippets etc.)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

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
          { name = "path" },
          { name = "buffer" },
          { name = "luasnip" },
        }),
      })
    '';

    # Autocmds & vimscript
    autoCmd = [
      {
        event = [ "FileType" ];
        pattern = [ "json" "nix" ];
        command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2";
      }
    ];

    extraConfigVim = ''
      filetype plugin indent on
    '';
  };
}
