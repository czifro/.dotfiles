{ config, lib, pkgs, user, ... }:

{

  programs.zsh.enable = true;
  programs.zsh.loginShellInit = ''
    source $HOME/.zprofile
  '';

  environment = {
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    systemPackages = [
      pkgs.home-manager
      pkgs.coreutils
    ];

    shells = [ pkgs.bash pkgs.zsh ];
    loginShell = pkgs.zsh;
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Application" ];
  };

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/personal/.dotfiles/core/master";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.defaults = {
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };
  };

  users.users.${user.name}.home = user.homeDarwin;
}

