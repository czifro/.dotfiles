{lib, pkgs, ...}:

{
  home.file = {
    zsh = {
      source = dotfiles/zsh/.config/zsh;
      target = ".config/zsh";
      recursive = true;
    };
    ".zprofile".source = dotfiles/zsh/.zprofile;
  };

  programs.zsh = {
    enable = true;
  };
}

