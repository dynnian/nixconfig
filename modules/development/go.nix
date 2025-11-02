{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    go 
    gopls 
    golangci-lint-langserver
    delve 
    gnumake 
    pkg-config
  ];
  CGO_ENABLED = "1";
}
