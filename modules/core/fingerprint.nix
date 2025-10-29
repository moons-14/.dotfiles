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
    sudo.text = lib.mkBefore ''
      auth sufficient pam_fprintd.so
    '';

    login.text = lib.mkBefore ''
      auth sufficient pam_fprintd.so
    '';

    greetd.text = lib.mkBefore ''
      auth sufficient pam_fprintd.so
    '';

    polkit-1.text = lib.mkBefore ''
      auth sufficient pam_fprintd.so
    '';
  };
}