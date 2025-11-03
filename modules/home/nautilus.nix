{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.nautilus
    gvfs sushi
    gradience
    adw-gtk3
    qogir-icon-theme
  ];

  gtk.enable = true;
  gtk.iconTheme = {
    name = "Qogir Icon Theme";
    package = pkgs.qogir-icon-theme;
  };
}
