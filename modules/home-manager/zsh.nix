{config, lib, pkgs, ...}:

{
  home.file = {
    ".config/zsh/env/common".source = dotfiles/zsh/.config/zsh/env/common;
    ".config/zsh/tools/nvm".source = dotfiles/zsh/.config/zsh/tools/nvm;
    ".zprofile".source = dotfiles/zsh/.zprofile;
  };

  home.sessionVariables = {
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    CONFIG_DIR = "${config.home.sessionVariables.XDG_CONFIG_HOME}";
    PAGER = "less";
    ZSH_TOOLS_DIR = "${config.home.sessionVariables.CONFIG_DIR}/zsh/tools";
    ZSH_ENV_DIR = "${config.home.sessionVariables.CONFIG_DIR}/zsh/env";
    WORKSPACES = "";
    HOMEBREW_PREFIX = "/opt/homebrew";
    HOMEBREW_CELLAR = "/opt/homebrew/Cellar";
    HOMEBREW_REPOSITORY = "/opt/homebrew";
    MANPATH = "/opt/homebrew/share/man\${MANPATH+:$MANPATH}:";
    INFOPATH = "/opt/homebrew/share/info:\${INFOPATH:-}";
    NVM_DIR = "${config.home.sessionVariables.XDG_CONFIG_HOME}/nvm";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  programs.zsh = {
    dotDir = ".config/zsh";
    enable = true;
    oh-my-zsh = {
      enable = true;
      extraConfig = ''
        export ZSH="$HOME/.oh-my-zsh"
        CASE_SENSITIVE="true"
      '';
      plugins = [
        "git"
      ];
      theme = "refined";
    };
  };
}

