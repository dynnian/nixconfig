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
      # GTK/GApps + SVG loaders (fixes “Unrecognized image file format” for SVG)
      gtk3
      gdk-pixbuf
      librsvg
      glib
      pango
      cairo
      atk

      # Common deps for RDM
      libsoup_3
      webkitgtk
      libsecret
      vte
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

    autoPatchelfIgnoreMissingDeps = false;

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
  home.packages = [
    rdm
  ];
}
