{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg:
    lib.getName pkg == "zoom-us";

  home.packages = with pkgs; [
    zoom-us
  ];
}
