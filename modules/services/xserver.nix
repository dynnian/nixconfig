{ pkgs, ... }: {
  services.xserver = {
    enable = true;

    windowManager.awesome = {
      enable = true;
      package = pkgs.awesome;
    };

    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha-lavender";
    };
  };

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "lavender";
      loginBackground = false;
    })
  ];
}
