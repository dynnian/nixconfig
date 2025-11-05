{ pkgs, ... }:
let
  colors = import ./../../user/colors.nix {};
  hex    = colors.hex;
in {
  programs.btop = {
    enable = true;
    package = pkgs.btop;

    settings = {
      color_theme = "catppuccin_mocha";
      truecolor   = true;
      vim_keys    = true;
      graph_symbol = "braille";
    };

    themes = {
      catppuccin_mocha = ''
        theme[main_bg]=${hex.base}
        theme[main_fg]=${hex.text}
        theme[title]=${hex.text}
        theme[hi_fg]=${hex.blue}
        theme[selected_bg]=${hex.surface1}
        theme[selected_fg]=${hex.blue}
        theme[inactive_fg]=${hex.overlay1}
        theme[graph_text]=${hex.rosewater}
        theme[meter_bg]=${hex.surface1}
        theme[proc_misc]=${hex.rosewater}

        theme[cpu_box]=${hex.mauve}
        theme[mem_box]=${hex.green}
        theme[net_box]=${hex.maroon}
        theme[proc_box]=${hex.blue}
        theme[div_line]=${hex.overlay0}

        theme[temp_start]=${hex.green}
        theme[temp_mid]=${hex.yellow}
        theme[temp_end]=${hex.red}

        theme[cpu_start]=${hex.teal}
        theme[cpu_mid]=${hex.sapphire}
        theme[cpu_end]=${hex.lavender}

        theme[free_start]=${hex.mauve}
        theme[free_mid]=${hex.lavender}
        theme[free_end]=${hex.blue}

        theme[cached_start]=${hex.sapphire}
        theme[cached_mid]=${hex.blue}
        theme[cached_end]=${hex.lavender}

        theme[available_start]=${hex.peach}
        theme[available_mid]=${hex.maroon}
        theme[available_end]=${hex.red}

        theme[used_start]=${hex.green}
        theme[used_mid]=${hex.teal}
        theme[used_end]=${hex.sky}

        theme[download_start]=${hex.peach}
        theme[download_mid]=${hex.maroon}
        theme[download_end]=${hex.red}

        theme[upload_start]=${hex.green}
        theme[upload_mid]=${hex.teal}
        theme[upload_end]=${hex.sky}

        theme[process_start]=${hex.sapphire}
        theme[process_mid]=${hex.lavender}
        theme[process_end]=${hex.mauve}
      '';
    };
  };
}
