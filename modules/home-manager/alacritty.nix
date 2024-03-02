{...}:

{
  home.file = {
    alacritty = {
      source = dotfiles/alacritty/.config/alacritty;
      target = ".config/alacritty";
      recursive = true;
    };
  };
}

