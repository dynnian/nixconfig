{ pkgs, ... }: let
  subtui = pkgs.callPackage
    ({ lib, stdenvNoCC, fetchzip, makeWrapper, mpv }:

      stdenvNoCC.mkDerivation rec {
        pname = "subtui";
        version = "1.3.0";

        src = fetchzip {
          url = "https://github.com/MattiaPun/SubTUI/releases/download/v${version}/SubTUI_linux_amd64.tar.gz";
          hash = "sha256-5e571fe47d18766d13e9c466e65d0504392f50f5201278fb4815723dae1c9030";
          stripRoot = true;
        };

        nativeBuildInputs = [ makeWrapper ];

        installPhase = ''
          runHook preInstall
          mkdir -p "$out/bin"

          if [ -f "./subtui" ]; then
            install -m755 ./subtui "$out/bin/subtui"
          else
            echo "Could not find SubTUI binary in the archive. Contents:"
            ls -la
            exit 1
          fi

          # Ensure mpv is available at runtime
          wrapProgram "$out/bin/subtui" --prefix PATH : ${lib.makeBinPath [ mpv ]}

          runHook postInstall
        '';

        meta = with lib; {
          description = "Subsonic TUI client (prebuilt release)";
          homepage = "https://github.com/MattiaPun/SubTUI";
          license = licenses.mit;
          platforms = [ "x86_64-linux" ];
          mainProgram = "subtui";
        };
      })
    { };
in
{
  home.packages = [ subtui ];
}
