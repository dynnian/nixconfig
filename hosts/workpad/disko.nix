{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            name = "ESP";
            start = "1M";
            end = "2G";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };

          luks = {
            size = "100%";
            type = "8300";
            content = {
              type = "luks";
              name = "cryptroot";
              device = "/dev/nvme0n1p2";
              settings = {
                allowDiscards = true;
              };
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
                    swap.swapfile.size = "32G";
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
