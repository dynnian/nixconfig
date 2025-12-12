{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    gcc
    gnumake
    cmake
    ninja
    pkg-config
    clang-tools
    lld
    openssl
    zlib
    gdb
    lldb
    valgrind
    strace
    ltrace
    patchelf
    shellcheck
  ];

  home.sessionVariables = {
    # A good default so builds don’t scatter temp files
    TMPDIR = "$HOME/.cache/tmp";
  };

  # Make sure TMPDIR exists on login shells (bash/zsh/fish will all benefit)
  home.activation.ensureDevCacheDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.cache/tmp"
  '';
}
