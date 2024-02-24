{lib, pkgs, ...}:

{
  home.file = {
    ".amethyst.yml".source = dotfiles/amethyst/.amethyst.yml;
  };
}

