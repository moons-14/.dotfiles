{ ... }:
{

  home.file.".config/ghostty/config" = {
    recursive = true;
    source = ./config;
  };

  home.file.".config/ghostty/themes/dracula" = {
    recursive = true;
    source = ./dracula.theme;
  };
}