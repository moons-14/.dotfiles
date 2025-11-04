{ ... }: {
  services = {

    blueman.enable = true; # Bluetooth Support
    tumbler.enable = true; # Image/video preview

    gnome.gnome-keyring.enable = true;

    upower.enable = true;
    tlp.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    logind = {
      lidSwitch = "suspend";          # Lock when lid is closed
      lidSwitchDocked = "ignore";  # Ignore when docked
      extraConfig = ''
        HandleLidSwitchExternalPower=lock
        LidSwitchIgnoreInhibited=no
      '';
    };
  };

  virtualisation.docker = {
    enable = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };
}