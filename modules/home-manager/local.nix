let

  user = import ../nixos/user.nix;

in

{
  home.username = user.name;
  home.homeDirectory = user.homeDarwin;
}

