{ pkgs, ... }: let
  subtui = pkgs.callPackage
    ({ lib, buildGoModule, fetchFromGitHub, makeWrapper, mpv }:

      buildGoModule rec {
        pname = "subtui";
        version = "2.9.2";

        src = fetchFromGitHub {
          owner = "MattiaPun";
          repo  = "SubTUI";
          rev   = "v${version}";
          hash  = "sha256-i14xvoNJBeoASZFhNTfAK3f4G0bQT2mGwzrsEB1qT+g=";
        };

        vendorHash = "sha256-EHmA5kET/kHez1tk8P0clnsHJUIZMKxZukuum/coI7c=";
        nativeBuildInputs = [ makeWrapper ];

        postInstall = ''
          # Normalize binary name in case upstream uses SubTUI
          if [ -f "$out/bin/SubTUI" ] && [ ! -f "$out/bin/subtui" ]; then
            mv "$out/bin/SubTUI" "$out/bin/subtui"
          fi

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
