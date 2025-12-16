{ pkgs, lib, ... }:
let
  dotnet = with pkgs.dotnetCorePackages; combinePackages [
    sdk_9_0
    sdk_10_0
    runtime_9_0
    runtime_10_0
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
    DOTNET_ROOT = "${dotnet}/share/dotnet";
    DOTNET_ROOT_X64 = "$DOTNET_ROOT";
    DOTNET_MULTILEVEL_LOOKUP = "0";
    DOTNET_NOLOGO = "1";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };

  home.activation.ensureDotnetDirs =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p \
        "$HOME/.dotnet/tools/"
    '';

  home.sessionPath = [
    "$HOME/.dotnet/tools"
  ];
}
