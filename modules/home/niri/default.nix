{ ... }:
{
  home.file.".config/niri/config.kdl" = {
    recursive = true;
    source = ./config.kdl;
  };
}