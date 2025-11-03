{ pkgs, ... }:
{
    gtk = {
      enable = true;
      theme = {
        name = "dracula-theme";
        package = pkgs.dracula-theme;
      };
      cursorTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
    };
}