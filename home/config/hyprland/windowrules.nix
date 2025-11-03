{ ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      workspace = [
        "w[t1], gapsout:0, gapsin:0"
        "w[tg1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
      windowrule = [
        "float, class:^(net.davidotek.pupgui2)$ #ProtonUp-Qt"
        "float, class:^(yad)$"
        "float, class:^(qt5ct)$"
        "float, class:^(nwg-look)$"
        "float, class:^(org.kde.ark)$"
        "float, class:^(pavucontrol)$"
        "float, class:^(blueman-manager)$"
        "float, class:^(nm-applet)$"
        "float, class:^(nm-connection-editor)$"
        "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float, class:^(com.obsproject.Studio)$,title:^(Controls)$"
        "float, class:^(qalculate-gtk)$"
        "float, class:^(xdg-desktop-portal-gtk)$"
        "float, class:^(xfce-polkit)$"
        "float, class:^(com.saivert.pwvucontrol)$"
        "float, title:^(Extension: (Bitwarden Password Manager) - Bitwarden — Mozilla Firefox)$"
        "float, class:^(brave-nngceckbapebfimnlniiiahkandclblb-Default)$"
        "float, class:^(chrome-nngceckbapebfimnlniiiahkandclblb-Default)$"
        "float, class:^(lxqt-policykit-agent)$"
        "float, class:^(snx-rs-gui)$"
        "float, class:^(stoken-gui)$"
        "float, class:^(electron)$, title:^(Open Files)$"
        "bordersize 0, floating:0, onworkspace:w[t1]"
        "rounding 0, floating:0, onworkspace:w[t1]"
        "bordersize 0, floating:0, onworkspace:w[tg1]"
        "rounding 0, floating:0, onworkspace:w[tg1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"
      ];
    };
  };
}
