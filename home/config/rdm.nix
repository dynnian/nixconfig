{ pkgs, lib, ... }: let
  rdm = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "rdm";
    version = "2025.3.1.1";

    src = pkgs.fetchurl {
      url = "https://cdn.devolutions.net/download/Linux/RDM/${version}/RemoteDesktopManager_${version}_amd64.deb";
      sha256 = "FED5962B7138BACF19AA2130E2EA88CB8D4361C3E4A1959F2B0611E8C3F2B883";
    };

    nativeBuildInputs = with pkgs; [
      dpkg
      autoPatchelfHook
      makeWrapper
      wrapGAppsHook3
    ];

    buildInputs = with pkgs; [
      gtk3 gdk-pixbuf librsvg glib pango cairo atk
      webkitgtk_4_1 libsoup_3
      libsecret vte
      alsa-lib lttng-ust
      libxcrypt-legacy icu openssl zlib libuuid

      xorg.libX11 xorg.libXext xorg.libXrender xorg.libXi xorg.libXcursor
      xorg.libICE xorg.libSM
    ];

    dontConfigure = true;
    dontBuild = true;

    unpackPhase = ''
      runHook preUnpack
      dpkg-deb -x "$src" .
      runHook postUnpack
    '';

    # nixpkgs 25.11: webkitgtk_4_0 + libsoup2 removed, but RDM still references them.
    autoPatchelfIgnoreMissingDeps = true;
    autoPatchelfIgnoreMissing = [
      "libsoup-2.4.so.1"
      "libwebkit2gtk-4.0.so.37"
    ];

    installPhase = ''
      runHook preInstall

      # Relocate /usr to FHS-ish layout in $out so desktop files are discoverable
      mkdir -p "$out"
      if [ -d "usr/lib" ]; then
        mkdir -p "$out/lib"
        cp -a usr/lib/* "$out/lib/"
      fi

      if [ -d "usr/share" ]; then
        mkdir -p "$out/share"
        cp -a usr/share/* "$out/share/"
      fi

      # Wrapper
      mkdir -p "$out/bin"
      makeWrapper "$out/lib/devolutions/RemoteDesktopManager/RemoteDesktopManager" \
        "$out/bin/rdm" \
        --set DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 0 \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath buildInputs}"

      # Patch desktop file(s) to use wrapper + a stable icon name
      if [ -d "$out/share/applications" ]; then
        for f in "$out/share/applications/"*.desktop; do
          [ -e "$f" ] || continue
          # Force Exec to wrapper
          sed -i 's|^Exec=.*|Exec=rdm|g' "$f"
          # Optional: ensure it has an icon key (adjust if you find a different icon basename)
          if grep -q '^Icon=' "$f"; then
            sed -i 's|^Icon=.*|Icon=RemoteDesktopManager|g' "$f"
          else
            echo 'Icon=RemoteDesktopManager' >> "$f"
          fi
        done
      fi

      runHook postInstall
    '';

    meta = with lib; {
      description = "Devolutions Remote Desktop Manager (RDM)";
      homepage = "https://devolutions.net/remote-desktop-manager/";
      license = licenses.unfreeRedistributable;
      platforms = [ "x86_64-linux" ];
      sourceProvenance = [ sourceTypes.binaryNativeCode ];
      mainProgram = "rdm";
    };
  };
in {
  home.packages = [ rdm ];
}
