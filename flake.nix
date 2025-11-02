{
  description = "My multi-host NixOS setup with Disko and Home Manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    python-validity = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor?ref=25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, disko, home-manager, python-validity, ... }@inputs:
    let
      system = "x86_64-linux";
      profile = import ./user/profile.nix {};

      devshells = import ./modules/development;

      overlayUnstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit (final) system;
          config = final.config;
        };
      };

      # Helper to build a NixOS system
      mkHost = name: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { 
          inherit inputs; 
          hostname = name;
        };
        modules = [
          {
            nixpkgs.overlays = [ overlayUnstable ];
            nixpkgs.config.allowUnfree = true;
          }

          disko.nixosModules.disko
          ./hosts/${name}/configuration.nix
          ./hosts/${name}/disko.nix
          home-manager.nixosModules.home-manager
          ({ config, ... }: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${profile.user} = import ./home/home.nix;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              hostname = config.networking.hostName;
            };
          })
          (if name == "claymore" then
            python-validity.nixosModules."06cb-009a-fingerprint-sensor"
          else {})
        ];
      };
    in {
      nixosConfigurations = {
        claymore = mkHost "claymore";
        workpad = mkHost "workpad";
      };

      devShells.x86_64-linux =
        let pkgs = import nixpkgs { inherit system; };
        in devshells { inherit pkgs; };
    };
}

