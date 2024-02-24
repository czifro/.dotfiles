{lib, pkgs, ...}:

{
  home.file = {
    zsh = {
      source = dotfiles/zsh/.config/zsh;
      target = ".config/zsh";
      recursive = true;
    };
  };

  programs.zsh = {
    enable = true;
    profileExtra = ''
      source $HOME/.zprofile
    '';
  };
}

