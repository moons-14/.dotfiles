{ ... }:
{
  programs.ghostty = {
    enable = true;
  };

  home.file.".config/ghostty/config" = {
    recursive = true;
    source = ./config;
  };
}