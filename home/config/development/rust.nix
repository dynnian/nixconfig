{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    rustc
    cargo
    rust-analyzer
  ];

  home.sessionVariables = {
    # XDG-compliant Cargo layout
    CARGO_HOME = "$HOME/.local/share/cargo";
    CARGO_TARGET_DIR = "$HOME/.local/share/cargo/target";
    CARGO_TERM_COLOR = "always";
  };

  home.sessionPath = [
    "$HOME/.local/share/cargo/bin"
  ];

  home.activation.ensureRustDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p \
        "$HOME/.local/share/cargo/bin" \
        "$HOME/.local/share/cargo/target"
    '';
}
