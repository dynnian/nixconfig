{ pkgs, ... }: {
  services.netbird = {
    clients.default = {
      enable = true;
      package = pkgs.unstable.netbird;
      config = {
        WgIface = "wt0";
        WgPort = 51820;
        DisableAutoConnect = true;
      };
    };
    
    ui = {
      enable = true;
      package = pkgs.unstable.netbird-ui.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          if [ -f $out/share/applications/netbird.desktop ]; then
            sed -i -e 's/^Name=NetBird$/Name=Netbird/' \
                   -e 's|^Exec=.*|Exec=netbird-ui|' \
                   $out/share/applications/netbird.desktop
          fi
        '';
      });
    };
  };
}
