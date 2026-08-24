{ pkgs, ... }: {
  services.netbird = {
    enable = true;
    package = pkgs.unstable.netbird;
    ui = {
      enable = true;
      package = pkgs.unstable.netbird-ui.overrideAttrs (oldAttrs: {
        postInstall = (oldAttrs.postInstall or "") + ''
          # Ensure Exec=netbird-ui is present for the NixOS wrapper substitution
          if [ -f $out/share/applications/netbird.desktop ]; then
            sed -i 's|^Exec=.*|Exec=netbird-ui|' $out/share/applications/netbird.desktop
          fi
        '';
      });
    };
  };
}
