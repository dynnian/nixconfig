{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
  hardware.steam-hardware.enable = true;
  environment.systemPackages = with pkgs; [ mangohud ];
}
