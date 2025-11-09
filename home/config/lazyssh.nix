# modules/lazyssh.nix
{ config, pkgs, lib, ... }:

let
  pname   = "lazyssh";
  version = "0.3.0";

  lazyssh = pkgs.buildGoModule {
    inherit pname version;

    src = pkgs.fetchFromGitHub {
      owner = "Adembc";
      repo  = "lazyssh";
      rev   = "v${version}";
      hash  = "sha256-6halWoLu9Vp6XU57wAQXaWBwKzqpnyoxJORzCbyeU5Q=";
    };

    vendorHash = "sha256-OMlpqe7FJDqgppxt4t8lJ1KnXICOh6MXVXoKkYJ74Ks=";

    # Upstream builds the app from ./cmd (see Makefile: CMD_DIR ?= ./cmd)
    # This yields a binary named "cmd" by default.
    subPackages = [ "cmd" ];

    # Embed version like upstream Makefile does
    ldflags = [
      "-s" "-w"
      "-X" "main.version=v${version}"
    ];

    nativeBuildInputs = [ pkgs.makeWrapper ];

    # After buildGoModule installs to $out/bin, rename whatever it produced to "lazyssh"
    postInstall = ''
      set -e
      # Identify the produced binary (commonly "cmd")
      if [ -x "$out/bin/lazyssh" ]; then
        bin="$out/bin/lazyssh"
      elif [ -x "$out/bin/cmd" ]; then
        mv "$out/bin/cmd" "$out/bin/lazyssh"
        bin="$out/bin/lazyssh"
      elif [ -x "$out/bin/source" ]; then
        # fallback if building from module root happened to name it "source"
        mv "$out/bin/source" "$out/bin/lazyssh"
        bin="$out/bin/lazyssh"
      else
        echo "lazyssh: could not find built binary in \$out/bin" >&2
        ls -l "$out/bin" || true
        exit 1
      fi

      # Ensure ssh is available at runtime
      wrapProgram "$bin" --prefix PATH : ${pkgs.openssh}/bin
    '';

    meta = with lib; {
      description = "Terminal-based SSH manager (TUI) reading ~/.ssh/config";
      homepage    = "https://github.com/Adembc/lazyssh";
      license     = licenses.asl20;
      mainProgram = "lazyssh";
      platforms   = platforms.linux;
    };
  };
in {
  home.packages = [ lazyssh ];
}
