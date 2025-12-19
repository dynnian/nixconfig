{ pkgs, ... }: {
  # enable systemd-boot
  boot.loader.systemd-boot.enable = true;

  # enable EFI support
  boot.loader.efi.canTouchEfiVariables = true;

  # disable the editor and set timeout to 0
  boot.loader.systemd-boot.editor = false;
  boot.loader.timeout = 0;

  # use the latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # kernel parameters to reduce verbosity and some security stuff
  boot.kernelParams = [
    "quiet" 
    "rd.systemd.show_status=false" 
    "rd.udev.log_level=3" 
    "udev.log_priority=3"
    "slab_nomerge"
    "page_poison=1"
    "page_alloc.shuffle=1"
    "debugfs=off"
    "uhid"
    "uinput"
    "hidp"
  ];

  # disable some kernel modules for security
  boot.blacklistedKernelModules = [
    # Obscure network protocols
    "ax25"
    "netrom"
    "rose"

    # Old or rare or insufficiently audited filesystems
    "adfs"
    "affs"
    "bfs"
    "befs"
    "cramfs"
    "efs"
    "erofs"
    "exofs"
    "freevxfs"
    "f2fs"
    "hfs"
    "hpfs"
    "jfs"
    "minix"
    "nilfs2"
    "omfs"
    "qnx4"
    "qnx6"
    "sysv"
    "ufs"
  ];

  ## Other security stuff
  # Hide kptrs even for processes with CAP_SYSLOG
  boot.kernel.sysctl."kernel.kptr_restrict" = 2;

  # Enable strict reverse path filtering (that is, do not attempt to route
  # packets that "obviously" do not belong to the iface's network; dropped
  # packets are logged as martians).
  boot.kernel.sysctl."net.ipv4.conf.all.log_martians" = true;
  boot.kernel.sysctl."net.ipv4.conf.all.rp_filter" = "2";
  boot.kernel.sysctl."net.ipv4.conf.default.log_martians" = true;
  boot.kernel.sysctl."net.ipv4.conf.default.rp_filter" = "2";

  # Ignore broadcast ICMP (mitigate SMURF)
  boot.kernel.sysctl."net.ipv4.icmp_echo_ignore_broadcasts" = true;

  # Ignore incoming ICMP redirects (note: default is needed to ensure that the
  # setting is applied to interfaces added after the sysctls are set)
  boot.kernel.sysctl."net.ipv4.conf.all.accept_redirects" = false;
  boot.kernel.sysctl."net.ipv4.conf.all.secure_redirects" = false;
  boot.kernel.sysctl."net.ipv4.conf.default.accept_redirects" = false;
  boot.kernel.sysctl."net.ipv4.conf.default.secure_redirects" = false;
  boot.kernel.sysctl."net.ipv6.conf.all.accept_redirects" = false;
  boot.kernel.sysctl."net.ipv6.conf.default.accept_redirects" = false;

  # Ignore outgoing ICMP redirects (this is ipv4 only)
  boot.kernel.sysctl."net.ipv4.conf.all.send_redirects" = false;
  boot.kernel.sysctl."net.ipv4.conf.default.send_redirects" = false;

  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.initrd.systemd.enable = true;
  systemd.settings.Manager.RebootWatchdogSec = "0";

  # enable plymouth for a graphical boot
  boot.plymouth = {
    enable = true;
    theme = "dragon";
    themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "dragon" ];
        })
      ];
  };
}
