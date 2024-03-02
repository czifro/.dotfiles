{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./amethyst.nix
    ./binaries.nix
    ./local.nix
    ./mozilla.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home = {
    stateVersion = "23.11";

    packages = [
      pkgs.git
      pkgs.ripgrep
      pkgs.tmux
      pkgs.rustup
      pkgs.go_1_21
    ];

    # This is an option, but I prefer splitting it out into neighboring nix files
    # file = {
    #   # tmux
    #   ".local/bin/tmux-sessionizer".source = ../core/tmux/tmux-sessionizer;
    #   ".tmux.conf".source = ../core/tmux/tmux.conf;
    # };
  };

  programs.home-manager.enable = true;

}

