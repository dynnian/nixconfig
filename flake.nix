{
  description = "My multi-host NixOS setup with Disko and Home Manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim?ref=nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    doom-emacs = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "";
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-unstable, 
    disko, 
    home-manager, 
    stylix,
    nixvim, 
    doom-emacs, 
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
          }

          disko.nixosModules.disko
          stylix.nixosModules.stylix
          ./hosts/${name}/configuration.nix
          ./hosts/${name}/disko.nix
          home-manager.nixosModules.home-manager
          ({ config, ... }: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${profile.user} = import ./home/home.nix;
            home-manager.backupFileExtension = "backup";
            home-manager.sharedModules = [
              nixvim.homeModules.nixvim
              stylix.homeModules.stylix
              doom-emacs.homeModule
            ];
            home-manager.extraSpecialArgs = {
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

