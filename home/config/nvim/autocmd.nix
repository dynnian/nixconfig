{ ... }: {
  programs.nixvim.autoCmd = [
    {
      event = [ "FileType" ];
      pattern = [ "json" "nix" ];
      command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2";
    }
  ];
}
