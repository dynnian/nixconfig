{ config, pkgs, lib, ... }: {
  # Automatically link all scripts from ./
  home.file = lib.attrsets.genAttrs (builtins.attrNames (builtins.readDir .)) (name: {
    source = "./${name}";
    target = ".local/bin/${name}";
    executable = true;
  });
}

