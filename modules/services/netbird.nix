{ pkgs, ... }: {
  services.netbird = {
    enable = true;
    package = pkgs.unstable.netbird;
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
