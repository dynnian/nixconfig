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

    gamemode.enable = true; 
  };

  environment.systemPackages = with pkgs; [ 
    mangohud 
    steamtinkerlaunch
  ];

  hardware.steam-hardware.enable = true;
}
