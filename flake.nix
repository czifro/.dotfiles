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

    nvim.url = "github:czifro/init.lua?ref=d2810aad92a71d70e8a99e12d925922d984b93bd";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, darwin, nvim, flake-utils, ... } @ inputs :

  let

  modules = {
    darwin = import ./modules/darwin;
    home-manager = import ./modules/home-manager;
    core = {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
      };
      users.users.czifro.home = (import ./modules/nixos/user.nix).homeDarwin;
    };
    nvim = nvim.modules.nvim;
  };

  pkgs = import nixpkgs { system = "aarch64-darwin"; };

  packages = [
    pkgs.git
    pkgs.ripgrep
    pkgs.tmux
    pkgs.rustc
    pkgs.cargo
  ] ++ nvim.packages;

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

    packages = packages;

    darwinConfigurations = {
      "Wills-MacBook-Pro" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = pkgs;
        modules = [
          modules.darwin
          home-manager.darwinModules.home-manager
          modules.home-manager
          modules.core
          {
            home-manager = {
              home.packages = packages;
              users.czifro.imports = [
                nvim.modules.nvim
                ./modules/home-manager
              ];
              extraSpecialArgs = { extraPkgs = packages; };
            };
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
