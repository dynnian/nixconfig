{ pkgs, lib, ... }:
let
  dotnet = with pkgs.dotnetCorePackages; combinePackages [
    # SDKs
    sdk_9_0
    sdk_10_0

    # Runtimes
    runtime_9_0
    runtime_10_0

    # ASP.NET Core runtimes
    aspnetcore_9_0
    aspnetcore_10_0
  ];
  csharpLsFixed = pkgs.writeShellScriptBin "csharp-ls" ''
    export DOTNET_ROOT="${dotnet}/share/dotnet"
    export DOTNET_ROOT_X64="$DOTNET_ROOT"
    export DOTNET_MULTILEVEL_LOOKUP=0
    exec "${pkgs.csharp-ls}/lib/csharp-ls/csharp-ls" "$@"
  '';
in {
  home.packages = with pkgs; [
    dotnet
    dotnetPackages.Nuget
    mono
    csharpier
    csharpLsFixed
    csharprepl
    jetbrains.rider
  ];

  home.sessionVariables = {
    # Helps Rider / tooling that expects DOTNET_ROOT
    DOTNET_ROOT = "${dotnet}/share/dotnet";
    DOTNET_ROOT_X64 = "$DOTNET_ROOT";

    # Recommended on NixOS to avoid “multi-level” probing / weirdness
    DOTNET_MULTILEVEL_LOOKUP = "0";

    # Writable locations (dotnet tends to assume these)
    DOTNET_CLI_HOME = "$HOME/.dotnet";
    NUGET_PACKAGES  = "$HOME/.nuget/packages";

    # Optional niceties
    DOTNET_NOLOGO = "1";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };

  home.activation.ensureDotnetDirs =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p \
        "$HOME/.dotnet" \
        "$HOME/.nuget/packages" \
        "$HOME/.nuget/NuGet" \
        "$HOME/.local/share/NuGet"
    '';
}
