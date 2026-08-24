{
  description = "My multi-host NixOS setup with Disko and Home Manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim?ref=nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    subtui = {
      url = "github:MattiaPun/SubTUI";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-06cb-009a-fingerprint-sensor = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor?ref=24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-unstable, 
    disko, 
    home-manager, 
    nixvim, 
    nixos-06cb-009a-fingerprint-sensor,
    ... 
  }@inputs:
    let
      system = "x86_64-linux";
      profile = import ./user/profile.nix {};

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
            # Bitwarden still depends on this
            nixpkgs.config.permittedInsecurePackages = [
              "electron-39.8.10"
            ];
          }

          disko.nixosModules.disko
          ./hosts/${name}/configuration.nix
          ./hosts/${name}/disko.nix
          home-manager.nixosModules.home-manager
          nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"
          ({ config, ... }: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${profile.user} = import ./home/home.nix;
            home-manager.backupFileExtension = "backup";
            home-manager.sharedModules = [
              nixvim.homeModules.nixvim
            ];
            home-manager.extraSpecialArgs = {
              inherit inputs;
              hostname = config.networking.hostName;
            };
          })
        ];
      };
    in {
      nixosConfigurations = {
        claymore = mkHost "claymore";
        zweihander = mkHost "zweihander";
        workpad = mkHost "workpad";
      };
    };
}

