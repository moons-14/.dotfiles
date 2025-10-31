{ inputs, pkgs, ... }:
{
  imports = [
    inputs.auth-keys-hub.nixosModules.auth-keys-hub
  ];

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PubkeyAuthentication = "yes";
    };
  };

  programs.auth-keys-hub = {
    enable = true;
    github.users = [ "moons-14:moons" ];
  };
}
