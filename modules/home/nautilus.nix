{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nautilus
    gvfs sushi
    gradience
    adw-gtk3
  ];

}
