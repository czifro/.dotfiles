{lib, pkgs, ...}:

{
  home.file = {
    mozilla = {
      source = dotfiles/mozilla/.mozilla;
      target = ".mozilla";
      recursive = true;
    };
  };
}

