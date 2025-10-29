{ pkgs, ... }:
{
  stylix = {
    enable = true;

    stylix.targets.gnome.enable = lib.mkForce false;
    stylix.targets.gnomeShell.enable = lib.mkForce false;
    stylix.targets.gdm.enable = lib.mkForce false;
    stylix.targets.gtk.enable = true;
    stylix.targets.qt.enable = true;

    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
}