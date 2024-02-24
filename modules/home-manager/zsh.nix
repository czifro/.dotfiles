{lib, pkgs, ...}:

{
  home.file = {
    ".config/zsh/env/common".source = dotfiles/zsh/.config/zsh/env/common;
    ".config/zsh/tools/brew".source = dotfiles/zsh/.config/zsh/tools/brew;
    ".config/zsh/tools/nvm".source = dotfiles/zsh/.config/zsh/tools/nvm;
    ".zprofile".source = dotfiles/zsh/.zprofile;
  };

  programs.zsh = {
    enable = true;
  };
}

