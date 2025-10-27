let
  profile = import ./user/profile.nix {};
in
{
  description = "My multi-host NixOS setup with Disko and Home Manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-${profile.nixos-version}";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    python-validity = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor?ref=${profile.nixos-version}";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, home-manager, python-validity, ... }@inputs:
    let
      system = "x86_64-linux";

      # Helper to build a NixOS system
      mkHost = name: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          disko.nixosModules.disko
          ./hosts/${name}/configuration.nix
          ./hosts/${name}/disko.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.drk = import ./home/home.nix;
            home-manager.backupFileExtension = "backup";
          }
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
    };
}

