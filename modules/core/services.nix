{ ... }: {
  services = {
    openssh = {
      enable = false; # Enable SSH
      settings = {
        PermitRootLogin = "no"; # Prevent root from SSH login
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = true;
      };
      ports = [ 22 ];
    };

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
  };

}