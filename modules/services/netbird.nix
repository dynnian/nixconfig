{ pkgs, ... }: {
  services.netbird = {
    enable = true;
    package = pkgs.unstable.netbird;
    ui = {
      enable = true;
      package = pkgs.unstable.netbird-ui.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          if [ -f $out/share/applications/netbird.desktop ]; then
            sed -i 's/^Name=NetBird$/Name=Netbird/' $out/share/applications/netbird.desktop
          fi
        '';
      });
    };
  };
}
