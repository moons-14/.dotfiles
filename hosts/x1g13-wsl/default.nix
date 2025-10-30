# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  imports =
    [
      inputs.nixos-wsl.nixosModules.wsl
    ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";
}
