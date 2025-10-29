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
    sudo.extraConfig = ''
      auth sufficient pam_fprintd.so
    '';

    login.extraConfig = ''
      auth sufficient pam_fprintd.so
    '';
  };
}