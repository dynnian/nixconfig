{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    go
    gopls
    gotools
    golangci-lint
    delve
  ];

  home.sessionVariables = {
    # XDG-compliant Go layout
    GOPATH = "$HOME/.local/share/go";
    GOBIN  = "$HOME/.local/share/go/bin";

    GOMODCACHE = "$HOME/.local/share/go/pkg/mod";
    GOCACHE    = "$HOME/.cache/go-build";
    GOTMPDIR   = "$HOME/.cache/go-tmp";
  };

  home.sessionPath = [
    "$HOME/.local/share/go/bin"
  ];

  home.activation.ensureGoDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p \
        "$HOME/.local/share/go/bin" \
        "$HOME/.local/share/go/pkg/mod" \
        "$HOME/.cache/go-build" \
        "$HOME/.cache/go-tmp"
    '';
}
