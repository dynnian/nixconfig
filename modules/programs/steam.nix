{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession = {
        enable = true;
        steamArgs = [ "-gamepadui" "-steamos3" "-steamdeck" ];
        env = { XDG_CURRENT_DESKTOP = "gamescope"; };
      };
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
