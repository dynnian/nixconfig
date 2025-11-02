{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    gcc
    clang
    gdb
    cmake
    ninja
    clang-tools
    pkg-config
    bear
    valgrind
  ];

  # Default compiler selection
  CC = "gcc";
  CXX = "g++";
}
