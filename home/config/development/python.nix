{ pkgs, lib, ... }:
let
  python = pkgs.python312;
  pythonpkgs = pkgs.python312Packages;
in {
  home.packages = with pkgs; [
    python
    pythonpkgs.pip
    pythonpkgs.virtualenv
    pythonpkgs.ipython
    pythonpkgs.black
    pythonpkgs.ruff
    pythonpkgs.mypy
    pythonpkgs.pyright
    pythonpkgs.setuptools
    pythonpkgs.wheel
  ];

  home.sessionVariables = {
    PYTHONUSERBASE = "$HOME/.local/share/python";
    PIP_CACHE_DIR  = "$HOME/.cache/pip";

    # Avoid writing .pyc into project trees
    PYTHONDONTWRITEBYTECODE = "1";

    # Make pip install --user binaries available
    PATH = "$HOME/.local/share/python/bin:$PATH";
  };

  home.sessionPath = [
    "$HOME/.local/share/python/bin"
  ];

  home.activation.ensurePythonXdgDirs =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p \
        "$HOME/.local/share/python/bin" \
        "$HOME/.cache/pip"
    '';
}
