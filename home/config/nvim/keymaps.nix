{ ... }: {
  programs.nixvim = {
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

      # Fast ones with just ctrl
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = { silent = true; desc = "Window left"; };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = { silent = true; desc = "Window down"; };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = { silent = true; desc = "Window up"; };
      }
      {
        mode = "n";
        key = "<C-l>";
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
        action = "<cmd>bnext<CR>";
        options = { silent = true; desc = "Next buffer"; };
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>bprevious<CR>";
        options = { silent = true; desc = "Previous buffer"; };
      }
    ];
  };
}
