{ ... }: {
  wayland.windowManager.hyprland = {
    settings = {
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
        "float, class:^(com.nextcloud.desktopclient.nextcloud)$"
        "float, class:^(qalculate-gtk)$"
        "float, class:^(xdg-desktop-portal-gtk)$"
        "float, class:^(xfce-polkit)$"
        "float, class:^(com.saivert.pwvucontrol)$"
        "float, initialTitle:^(_crx_nngceckbapebfimnlniiiahkandclblb)$"
        "float, class:^(lxqt-policykit-agent)$"
        "float, class:^(snx-rs-gui)$"
        "float, class:^(stoken-gui)$"
        "float, class:^(electron)$, title:^(Open Files)$"
        "float, initialTitle:^(Welcome to JetBrains Rider)$"
      ];
    };
  };
}
