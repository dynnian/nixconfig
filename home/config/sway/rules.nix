{ ... }: 
let
  ii = "inhibit_idle focus";
  game = "inhibit_idle focus; floating enable; border none; fullscreen enable; shadows disable";
  popup = "floating enable; border pixel 1; sticky enable; shadows enable";
  float = "floating enable; border pixel 1; shadows enable";
  important = "inhibit_idle open; floating enable; border pixel 1";
  max = "inhibit_idle visible; floating enable; sticky enable; border pixel 1";
in
{
  wayland.windowManager.sway.config = {
    window.commands = [
      # --- II Group ---
      { command = ii; criteria = { class = "Cemu"; }; }
      { command = ii; criteria = { instance = "cemu"; }; }
      { command = ii; criteria = { app_id = "cemu"; }; }
      { command = ii; criteria = { app_id = "rpcs3"; }; }
      { command = ii; criteria = { app_id = "yuzu"; }; }
      { command = ii; criteria = { class = "yuzu"; }; }
      { command = ii; criteria = { app_id = "snes9x-gtk"; }; }

      # --- Game Group ---
      { command = game; criteria = { instance = "origin.exe"; }; }
      { command = game; criteria = { instance = "gamescope"; }; }
      { command = game; criteria = { class = "dolphin-emu"; title = "Dolphin (.*) \\| (.*) \\| (.*) \\| (.*)"; }; }
      { command = game; criteria = { class = "sm64ex"; }; }
      { command = game; criteria = { class = "gamescope"; }; }
      { command = game; criteria = { class = "steam_app.*"; }; }
      { command = game; criteria = { instance = "steam_app.*"; }; }
      { command = game; criteria = { class = "LLBlaze.x86_64"; }; }
      { command = game; criteria = { app_id = "clonehero"; }; }
      { command = "${game}; saturation set 2"; criteria = { app_id = "CombatMaster.x86_64"; }; }

      # --- Popup Group ---
      { command = popup; criteria = { app_id = "firefox"; title = "^Picture-in-Picture$"; }; }
      { command = popup; criteria = { app_id = "stoken-gui"; }; }
      { command = popup; criteria = { app_id = "org.twosheds.iwgtk"; }; }
      { command = popup; criteria = { app_id = "iwgtk"; }; }
      { command = popup; criteria = { app_id = "ksysguard"; }; }
      { command = popup; criteria = { app_id = "galculator"; }; }
      { command = popup; criteria = { app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; title = "(?:Open|Save) (?:File|Folder|As)"; }; }
      { command = popup; criteria = { app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; title = "^(File|Folder)\\s*Already Exists\\s*—\\s*"; }; }
      { command = popup; criteria = { app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; title = "Confirm to replace files"; }; }
      { command = popup; criteria = { app_id = "pavucontrol"; }; }
      { command = popup; criteria = { app_id = "qtalarm"; }; }
      { command = popup; criteria = { app_id = "deluge"; title = "Add Torrents*"; }; }

      # --- Float Group ---
      { command = "${float}; blur off; shadows disable; inhibit_idle open"; criteria = { app_id = "org.telegram.desktop"; }; }
      { command = float; criteria = { app_id = "com.github.weclaw1.ImageRoll"; }; }
      { command = float; criteria = { app_id = "teams-for-linux"; }; }
      { command = float; criteria = { app_id = "viewnior"; }; }
      { command = float; criteria = { instance = "viewnior"; }; }
      { command = float; criteria = { instance = "yakyak"; }; }
      { command = float; criteria = { class = "Microsoft Teams - Preview"; }; }
      { command = float; criteria = { class = "teams-for-linux"; }; }
      { command = float; criteria = { class = "Microsoft Teams - Insiders"; }; }
      { command = float; criteria = { app_id = "Alacritty_floating"; }; }
      { command = float; criteria = { app_id = "dolphin"; title = "^Information\\s*—\\s*Dolphin"; }; }
      { command = float; criteria = { app_id = "org.kde.ark"; title = "^Loading archive"; }; }
      { command = float; criteria = { instance = "crx_nckgahadagoaajjgafhacjanaoiihapd"; }; }
      { command = float; criteria = { app_id = "pcmanfm-qt"; title = "Preferences"; }; }
      { command = float; criteria = { app_id = "pcmanfm-qt"; title = "File Properties"; }; }
      { command = float; criteria = { app_id = "anki"; }; }
      { command = float; criteria = { app_id = "cmus"; }; }
      { command = float; criteria = { app_id = "subtui"; }; }
      { command = float; criteria = { app_id = "impala"; }; }
      { command = float; criteria = { app_id = "bluetui"; }; }
      { command = float; criteria = { app_id = "clipse"; }; }
      { command = float; criteria = { app_id = "pulsemixer"; }; }
      { command = float; criteria = { app_id = "btop"; }; }
      { command = float; criteria = { app_id = "yazi"; }; }
      { command = float; criteria = { app_id = "newsboat"; }; }
      { command = float; criteria = { app_id = "ani-cli"; }; }
      { command = float; criteria = { app_id = "youtube-tui"; }; }
      { command = float; criteria = { app_id = "timr-tui"; }; }
      
      # Float window types (shadows enable is appended)
      { command = "${float}; shadows enable"; criteria = { window_role = "pop-up,task_dialog,About"; }; }
      { command = "${float}; shadows enable"; criteria = { window_type = "dialog"; }; }
      { command = "${float}; shadows enable"; criteria = { window_type = "utility"; }; }
      { command = "${float}; shadows enable"; criteria = { window_type = "toolbar"; }; }
      { command = "${float}; shadows enable"; criteria = { window_type = "splash"; }; }
      { command = "${float}; shadows enable"; criteria = { window_type = "menu"; }; }
      { command = "${float}; shadows enable"; criteria = { window_type = "dropdown_menu"; }; }
      { command = "${float}; shadows enable"; criteria = { window_type = "popup_menu"; }; }
      { command = "${float}; shadows enable"; criteria = { window_type = "tooltip"; }; }
      { command = "${float}; shadows enable"; criteria = { window_type = "notification"; }; }

      # --- Important Group ---
      { command = important; criteria = { app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; title = "Move files"; }; }
      { command = important; criteria = { app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; title = "^(Copying|Moving)\\s*—\\s*Dolphin"; }; }
      { command = important; criteria = { app_id = "(dolphin|org.kde.ark)"; title = "^Extracting\\s"; }; }
      { command = important; criteria = { app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; title = "Copy Files"; }; }
      { command = important; criteria = { app_id = "dolphin|org.kde.ark|pcmanfm|pcmanfm-qt"; title = "Delete Files"; }; }
      { command = important; criteria = { app_id = "pcmanfm|pcmanfm-qt"; title = "Removable medium is inserted"; }; }
      { command = "${important}; resize set width 18 ppt"; criteria = { app_id = "org.kde.ark"; title = "Compressing (.*) — Ark"; }; }

      # --- Max Group ---
      { command = max; criteria = { instance = "chromium"; title = "MAX - Chromium"; }; }
      { command = max; criteria = { app_id = "chromium"; title = "MAX - Chromium"; }; }
      { command = "${max}; focus; move position center"; criteria = { app_id = "chromium"; title = "MAX - Chromium"; urgent = "recent"; }; }
      { command = max; criteria = { instance = "chromium"; title = "https:\\/\\/max.niceincontact.com\\/index.html - Chromium"; }; }
      { command = max; criteria = { app_id = "chromium"; title = "https:\\/\\/max.niceincontact.com\\/index.html - Chromium"; }; }
      { command = "${max}; focus; move position center"; criteria = { app_id = "chromium"; title = "https:\\/\\/max.niceincontact.com\\/index.html - Chromium"; urgent = "latest"; }; }

      # --- Misc Group ---
      { command = "floating enable; max_render_time off; blur disabled"; criteria = { class = "steam"; }; }
      { command = "floating enable; max_render_time off; blur disabled"; criteria = { class = "wgc.exe"; }; }
      { command = "floating disable; inhibit_idle none"; criteria = { app_id = "org.telegram.desktop"; title = "Telegram"; }; }
      { command = "focus"; criteria = { urgent = "latest"; }; }
      { command = "saturation set 2; blur enable"; criteria = { app_id = "alacritty"; }; }
      { command = "floating enable; kill"; criteria = { app_id = "firefox"; title = "Firefox — Sharing Indicator"; }; }
      { command = "floating enable; kill"; criteria = { title = "Wine System Tray"; }; }
      { command = "floating enable; border normal"; criteria = { title = "Android Emulator - *"; }; }
      { command = "move scratchpad"; criteria = { title = "Emulator"; window_type = "utility"; }; }
      { command = "floating enable"; criteria = { app_id = "brave-nngceckbapebfimnlniiiahkandclblb-Default"; }; }
      { command = "floating enable"; criteria = { title = "Extension: (Bitwarden Password Manager) - Bitwarden — Mozilla Firefox"; }; }
      { command = "floating enable"; criteria = { title = "Extension: (Bitwarden Password Manager) - Bitwarden — Zen Browser"; }; }
      { command = "floating enable"; criteria = { title = "Open File"; }; }
      { command = "floating enable"; criteria = { title = "About"; }; }
      { command = "floating enable"; criteria = { app_id = "xdg-desktop-portal-gtk"; }; }
      { command = "floating enable"; criteria = { app_id = "qalculate-gtk"; }; }
      { command = "floating enable"; criteria = { app_id = "com.nextcloud.desktopclient.nextcloud"; }; }
      { command = "floating enable"; criteria = { app_id = "snx-rs-gui"; }; }
    ];

  };

  # Handle Rules that don't fit standard criteria maps
  # Home Manager's `criteria` option expects key="value".
  # Rules like `[floating]` (which has no value) must go in extraConfig.
  wayland.windowManager.sway.extraConfig = ''
      for_window [floating] shadows enable
    '';
}
