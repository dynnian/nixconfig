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
    nixvim = {
      url = "github:nix-community/nixvim?ref=nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    doom-emacs = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "";
    };
    awesome-src = {
      url = "github:awesomeWM/awesome";
      flake = false; # source repo only
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-unstable, 
    disko, 
    home-manager, 
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

      overlayAwesomeGit = final: prev: {
        awesome = prev.unstable.awesome.overrideAttrs (old: {
          src = inputs.awesome-src;
          version = "git-${inputs.awesome-src.rev or "dirty"}";
      
          patches = [ ];
          prePatch = "";
          postPatch = "";
      
          preBuild = (old.preBuild or "") + ''
            export HOME="$TMPDIR"
            export XDG_CACHE_HOME="$TMPDIR/.cache"
            mkdir -p "$XDG_CACHE_HOME/fontconfig"
          '';
      
          # Disable building docs/examples (this is what triggers _postprocess.lua)
          cmakeFlags = (old.cmakeFlags or []) ++ [
            "-DBUILD_DOC=OFF"
            "-DBUILD_DOCS=OFF"
            "-DGENERATE_DOC=OFF"
            "-DGENERATE_EXAMPLES=OFF"
          ];
        });
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
            nixpkgs.overlays = [ overlayUnstable overlayAwesomeGit ];
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
            home-manager.sharedModules = [
              nixvim.homeModules.nixvim
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

