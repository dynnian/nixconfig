{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    dotnet-sdk
    dotnet-sdk_9
    dotnet-runtime
    dotnet-runtime_9
    dotnet-aspnetcore
    dotnet-aspnetcore_9
    csharp-ls
    csharpier
    csharprepl
  ];
  DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  DOTNET_NOLOGO = "1";
}
