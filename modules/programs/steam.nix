{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
  hardware.steam-hardware.enable = true;
  hardware.xone.enable = true;
  environment.systemPackages = with pkgs; [ mangohud ];
}
