{lib, pkgs, ...}:

{
  home = {
    file = {
      ".config/wallpapers".source = builtins.fetchGit {
        url = "https://github.com/D3Ext/aesthetic-wallpapers.git";
        rev = "7a02a317965fcc47961a32d84d6c090191d15c27";
      };
    };
  };
}

