{ ... }: {
  # set XDG user directories environment variables
  environment.sessionVariables = {
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_CACHE_HOME = "\${HOME}/.cache";
    XDG_DATA_HOME = "\${HOME}/.local/share";
    XDG_BIN_HOME = "\${HOME}/.local/bin";
    XDG_DESKTOP_HOME = "\${HOME}/Desktop";
    XDG_DOCUMENTS_HOME = "\${HOME}/Documents";
    XDG_DOWNLOADS_HOME = "\${HOME}/Downloads";
    XDG_PICTURES_HOME = "\${HOME}/Pictures";
    XDG_PUBLIC_HOME = "\${HOME}/Public";
    XDG_TEMPLATES_HOME = "\${HOME}/Templates";
    XDG_VIDEOS_HOME = "\${HOME}/Videos";
  };
}
