{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    # --- Core build / C/C++ toolchain ---
    gcc
    gnumake
    cmake
    ninja
    pkg-config
    clang
    clang-analyzer
    lld
    llvm
    llvmPackages.bintools

    # common libs used by lots of builds
    openssl
    zlib

    # super common for build/debug
    gdb
    lldb
    valgrind
    strace
    ltrace
    patchelf

    # quality-of-life for editing/building
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
