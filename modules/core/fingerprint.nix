{ ... }:
{
  services.fprintd.enable = true;

  # Add fingerprint command
  # fprintd-enroll
  # List fingerprints
  # fprintd-list $USER
  # Test fingerprint authentication
  # fprintd-verify

  security.pam.services = {
    login.fprintAuth = true;

    # sudo
    sudo.fprintAuth = true;

    # greetd (tuigreet / ReGreet)
    greetd.fprintAuth = true;

    # lock screen
    swaylock.fprintAuth = true;
  };
}