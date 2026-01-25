{ ... }: {
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

    mangohud = {
      enable = true;
    };
  };

  hardware.steam-hardware.enable = true;
}
