{ pkgs }:
{
  rust    = import ./devshells/rust.nix    { inherit pkgs; };
  go      = import ./devshells/go.nix      { inherit pkgs; };
  cc      = import ./devshells/cc.nix      { inherit pkgs; };
  dotnet  = import ./devshells/dotnet.nix  { inherit pkgs; };
}
