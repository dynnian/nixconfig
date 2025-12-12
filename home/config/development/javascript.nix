{ pkgs, lib, ... }:
let
  node = pkgs.nodejs;
  np = pkgs.nodePackages;
in {
  home.packages = with pkgs; [
    node
    np.npm
    np.pnpm
    yarn
    np.typescript
    np.typescript-language-server
    np.eslint
    np.prettier
    np.nodemon
  ];

  home.sessionVariables = {
    # --- npm ---
    # Prefer XDG paths
    NPM_CONFIG_USERCONFIG = "$HOME/.config/npm/npmrc";
    NPM_CONFIG_CACHE      = "$HOME/.cache/npm";
    NPM_CONFIG_PREFIX     = "$HOME/.local/share/npm";

    # --- pnpm ---
    PNPM_HOME       = "$HOME/.local/share/pnpm";
    PNPM_STORE_PATH = "$HOME/.cache/pnpm-store";

    # --- yarn ---
    YARN_CACHE_FOLDER  = "$HOME/.cache/yarn";
    YARN_GLOBAL_FOLDER = "$HOME/.local/share/yarn";

    # Node REPL history (keep it out of $HOME root)
    NODE_REPL_HISTORY = "$HOME/.local/share/node/repl_history";
  };

  home.sessionPath = [
    "$HOME/.local/share/npm/bin"
    "$HOME/.local/share/pnpm"
    "$HOME/.local/share/yarn/bin"
  ];

  home.activation.ensureNodeXdgDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p \
      "$HOME/.config/npm" \
      "$HOME/.cache/npm" \
      "$HOME/.cache/pnpm-store" \
      "$HOME/.cache/yarn" \
      "$HOME/.local/share/npm" \
      "$HOME/.local/share/pnpm" \
      "$HOME/.local/share/yarn" \
      "$HOME/.local/share/node"
    touch "$HOME/.config/npm/npmrc"
  '';
}
