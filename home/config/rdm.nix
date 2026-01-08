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
      # GTK/GApps + SVG pixbuf loader
      gtk3
      gdk-pixbuf
      librsvg
      glib
      pango
      cairo
      atk

      # Newer webkit stack that still exists in nixpkgs 25.11
      webkitgtk_4_1
      libsoup_3

      libsecret
      vte

      # missing deps from your earlier auto-patchelf log
      alsa-lib    # libasound.so.2
      lttng-ust   # liblttng-ust.so.0

      # common runtime deps
      libxcrypt-legacy
      icu
      openssl
      zlib
      libuuid

      xorg.libX11
      xorg.libXext
      xorg.libXrender
      xorg.libXi
      xorg.libXcursor
    ];

    dontConfigure = true;
    dontBuild = true;

    unpackPhase = ''
      runHook preUnpack
      dpkg-deb -x "$src" .
      runHook postUnpack
    '';

    # 25.11: webkitgtk_4_0 and libsoup2 are gone, but the binary still references them.
    # We ignore these *specific* missing deps so the build can succeed.
    autoPatchelfIgnoreMissingDeps = true;
    autoPatchelfIgnoreMissing = [
      "libsoup-2.4.so.1"
      "libwebkit2gtk-4.0.so.37"
    ];

    installPhase = ''
      runHook preInstall

      mkdir -p "$out"
      cp -a ./usr "$out/"

      mkdir -p "$out/bin"
      makeWrapper "$out/usr/lib/devolutions/RemoteDesktopManager/RemoteDesktopManager" \
        "$out/bin/rdm" \
        --set DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 0 \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath buildInputs}"

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
