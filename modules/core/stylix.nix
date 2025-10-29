{ pkgs, lib, ... }:
{
  stylix = {
    enable = true;

    targets = {
      gnome.enable = lib.mkForce false;
      gnomeShell.enable = lib.mkForce false;
      gdm.enable = lib.mkForce false;
      gtk.enable = true;
      qt.enable = true;
    };

    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
}