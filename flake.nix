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

    nvim.url = "github:czifro/init.lua?ref=f6ea877f70395bfd8407a4065fe418013a18240b";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, darwin, nvim, flake-utils, ... } @ inputs :

  let

  host = {
    name = "Wills-MacBook-Pro";
    system = "aarch64-darwin";
  };

  user = import ./modules/nixos/user.nix;

  modules = {
    darwin = import ./modules/darwin;
    home-manager = {
      home = import ./modules/home-manager;
      nvim = nvim.modules.home-manager.nvim;
    };
  };
  
  pkgs = import nixpkgs { system = host.system; };

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

    host = host;

    user = user;

    modules = modules;

    darwinConfigurations = {
      ${host.name} = darwin.lib.darwinSystem {
        system = host.system;
        pkgs = pkgs;
        modules = [ modules.darwin ];
        specialArgs = {
          inherit inputs;
          user = user;
        };
      };
    };

    homeConfigurations = {
      ${user.name} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          modules.home-manager.home
          modules.home-manager.nvim
        ];
      };
    };
  };
}
