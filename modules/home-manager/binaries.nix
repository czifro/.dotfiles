
{lib, pkgs, ...}:

{
  home = {
    file = {
      bin = {
        source = ./binaries;
        target = ".local/bin";
        recursive = true;
      };
    };
  };
}
