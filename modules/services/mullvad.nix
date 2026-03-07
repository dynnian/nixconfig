{ pkgs, ... }: {
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad;

  environment.systemPackages = with pkgs; [
    mullvad-vpn
  ];
}
