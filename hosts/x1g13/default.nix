# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  imports =
    [
      inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-13th-gen
      ./../../modules/drivers/intel-drivers.nix
      ./../../modules/core/secure-boot.nix
      ./hardware-configuration.nix
    ];
}
