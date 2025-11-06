# modules/lazyssh.nix
{ config, pkgs, lib, ... }:

let
  pname = "lazyssh";
  version = "0.3.0";

  # Map Nix platform -> upstream release asset arch string
  arch =
    if pkgs.stdenv.hostPlatform.system == "x86_64-linux" then "x86_64"
    else if pkgs.stdenv.hostPlatform.system == "aarch64-linux" then "arm64"
    else throw "lazyssh: unsupported system ${pkgs.stdenv.hostPlatform.system}";

  # Upstream publishes: lazyssh_Linux_${arch}.tar.gz
  release = pkgs.fetchzip {
    url = "https://github.com/Adembc/${pname}/releases/download/v${version}/${pname}_Linux_${arch}.tar.gz";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    stripRoot = false;  # the tarball contains a single 'lazyssh' file
  };

  lazyssh = pkgs.stdenv.mkDerivation {
    inherit pname version;
    # We’ll copy directly from the already-unpacked release path
    src = release;
    dontUnpack = true;

    nativeBuildInputs = [ pkgs.makeWrapper ];

    installPhase = ''
      install -Dm755 "$src/lazyssh" "$out/bin/lazyssh"
      # ensure the program finds ssh on PATH
      wrapProgram "$out/bin/lazyssh" --prefix PATH : ${pkgs.openssh}/bin
    '';

    meta = with lib; {
      description = "Terminal-based SSH manager (TUI) reading ~/.ssh/config";
      homepage    = "https://github.com/Adembc/lazyssh";
      license     = licenses.asl20;
      platforms   = [ "x86_64-linux" "aarch64-linux" ];
      mainProgram = "lazyssh";
    };
  };
in {
  # installs the package
  home.packages = [ lazyssh ];
}
