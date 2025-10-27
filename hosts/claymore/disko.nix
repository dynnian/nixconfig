{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              type = "8300";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];

                subvolumes = {
                  "@" = {
                    mountOptions = [
                      "ssd"
                      "noatime"
                      "discard=async"
                      "compress=zstd"
                    ];
                    mountpoint = "/";
                  };
                  "@/home" = {
                    mountOptions = [
                      "ssd"
                      "noatime"
                      "discard=async"
                      "compress=zstd"
                    ];
                    mountpoint = "/home";
                  };
                  "@/nix" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                    mountpoint = "/nix";
                  };
                  "@/swap" = {
                    mountpoint = "/.swapvol";
                    swap.swapfile.size = 32 * 1024;
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
