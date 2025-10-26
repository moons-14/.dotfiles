# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  

  # Define your hostname.
  networking.hostName = "x1g9";

  home-manager.users.moons = {
    imports = [
      ../../home-manager/moons/default.nix
      ../../modules/hm/gui.nix
      ../../home-manager/hosts/x1g9.nix
    ];
  };
}
