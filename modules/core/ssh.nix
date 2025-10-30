{ inputs, pkgs, ... }:
{
  imports = [ inputs.auth-keys-hub.nixosModules.auth-keys-hub ];

  programs.ssh.startAgent = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no"; # Prevent root from SSH login
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = true;
    };
    ports = [ 22 ];
  };

  programs.auth-keys-hub = {
    enable = true;
    github = {
      users = [ "moons-14:moons" ];
    };
  };
}
