{ config, lib, pkgs, ... }: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      line_break = {
        disabled = true;
      };

      character = {
        error_symbol = "[ ](bold red) ";
        success_symbol = "[ ](bold green)";
      };

      directory = {
        truncation_length = 5;
        home_symbol = " ";
        format = "[$path](bold italic yellow) ";
      };

      hostname = {
        ssh_only = false;
        disabled = false;
        style = "italic #87A752";
      };

      package = {
        disabled = true;
      };

      username = {
        show_always = true;
        style_user = "bold red";
        format =  "[$user]($style)[ in ](white)";
      };
    };
  };
}
