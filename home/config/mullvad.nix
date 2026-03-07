{ pkgs, ... }: {
  home.packages = with pkgs; [
    mullvad-vpn
  ];

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad;
}
