{ pkgs, ... }:
{
    gtk = {
      enable = true;
      theme = {
        name = "Dracula-Dark";
        package = pkgs.dracula-theme;
      };
      cursorTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };
      iconTheme = {
        package = pkgs.dracula-icon-theme;
        name = "Dracula-Dark";
      };
    };
}