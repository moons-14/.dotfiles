{ ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 8;
    efi.canTouchEfiVariables = true;
  };
}