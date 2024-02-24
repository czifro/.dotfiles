{lib, pkgs, ...}:

{
  home.file = {
    ".amethyst.conf".source = dotfiles/amethyst/.amethyst.yml;
  };
}

