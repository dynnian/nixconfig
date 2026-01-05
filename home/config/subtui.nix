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
          # Build once, Nix will tell you the real hash.
          hash  = lib.fakeHash;
        };

        # Build once, Nix will tell you the real vendorHash.
        vendorHash = lib.fakeHash;

        # Pure Go build (no libmpv, no cgo)
        env.CGO_ENABLED = "0";

        nativeBuildInputs = [ makeWrapper ];

        # If the repo builds from a subdir (common pattern), change this to:
        # subPackages = [ "./cmd/subtui" ];
        # Leave unset first; only set if Nix errors saying “no Go files” or similar.

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
          description = "Subsonic TUI client (spawns mpv via IPC)";
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
