{
  description = "Will's Nix System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim.url = "github:czifro/init.lua?ref=5b6eb1dcb1031177e3313d3315c1a2f5e5885a25";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, home-manager, darwin, nvim, flake-utils, ... } @ inputs :

  let

  modules = {
    darwin = import ./modules/darwin;
    home-manager = import ./modules/home-manager;
    core = {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.czifro.imports = [
          nvim.modules.nvim
          ./modules/home-manager
        ];
      };
      users.users.czifro.home = (import ./modules/nixos/user.nix).homeDarwin;
    };
  };

  in

  {
    # When I acquire my System76 desktop, I will uncomment this and comment out the darwinConfigurations
    # nixosConfigurations = {
    #   "nixos" = inputs.nixpkgs.lib.nixosSystem {
    #     system = "x86_64-linux";
    #     modules = [
    #       ./nixos/configuration.nix
    #       home-manager.nixosModules.home-manager
    #       {
    #         home-manager.users.nixos = import ./home/home.nix;
    #       }
    #     ];
    #   };
    # };

    modules = modules;

    darwinConfigurations = {
      "Wills-MacBook-Pro" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          modules.darwin
          home-manager.darwinModules.home-manager
          modules.core
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
