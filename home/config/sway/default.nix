{ ... }: {
  imports = [
    ./sway.nix
    ./autostart.nix
    ./binds.nix
    ./env.nix
    ./input.nix
    ./output.nix
    ./rules.nix
    ./swayidle.nix
    ./swaylock.nix
    ./theme.nix
  ];
}
