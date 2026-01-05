{ pkgs, ... }: let
  subtui = pkgs.callPackage
    ({ lib, buildGoModule, fetchFromGitHub, makeWrapper, mpv }:

      buildGoModule rec {
        pname = "subtui";
        version = "1.3.0";

        src = fetchFromGitHub {
          owner = "MattiaPun";
          repo  = "SubTUI";
          rev   = "v${version}";
          hash  = "sha256-1Jqi1NxC5lUV3wmvSRwPRG/PWm3f6wM71k7HeI4fanY=";
        };

        vendorHash = lib.fakeHash;
        nativeBuildInputs = [ makeWrapper ];

        postInstall = ''
          # Ensure mpv is available at runtime (PATH)
          if [ -f "$out/bin/subtui" ]; then
            wrapProgram "$out/bin/subtui" --prefix PATH : ${lib.makeBinPath [ mpv ]}
          fi
        '';

        meta = with lib; {
          description = "Subsonic TUI client";
          homepage = "https://github.com/MattiaPun/SubTUI";
          license = licenses.mit;
          platforms = [ "x86_64-linux" "aarch64-linux" ];
          mainProgram = "subtui";
        };
      })
    {};
in
{
  home.packages = [ subtui ];
}
