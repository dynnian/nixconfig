{ ... }: {
  services.netbird = {
    enable = true;
    ui.enable = true;
    clients.wt0 = {
      port = 51821;
      ui.enable = true;
      openFirewall = true;
      openInternalFirewall = true;
    };
  };
}
