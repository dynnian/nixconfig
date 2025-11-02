{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    rustc 
    cargo 
    rust-analyzer
    pkg-config 
    openssl 
    gcc
  ];
  RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;
}
