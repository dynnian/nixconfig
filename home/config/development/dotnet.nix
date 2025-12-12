{ pkgs, ... }:
let
  sdk = pkgs.dotnet-sdk_10;
in
{
  home.packages = with pkgs; [
    dotnet-sdk_10
    dotnet-runtime_10
    dotnet-aspnetcore_10
    dotnetPackages.Nuget
    mono
    csharpier
    csharp_ls
    csharprepl
    jetbrains.rider
  ];

  home.sessionVariables = {
    # Helps Rider / tooling that expects DOTNET_ROOT
    DOTNET_ROOT = "${sdk}/share/dotnet";

    # Strongly recommended on NixOS to avoid “multi-level” probing / weirdness
    DOTNET_MULTILEVEL_LOOKUP = "0";

    # Make workloads/tools use writable locations (important on NixOS)
    DOTNET_CLI_HOME = "$HOME/.dotnet";
    NUGET_PACKAGES = "$HOME/.nuget/packages";

    # Optional niceties
    DOTNET_NOLOGO = "1";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };
}
