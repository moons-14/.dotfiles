{ inputs, pkgs, ... }:
{
  imports = [ inputs.auth-keys-hub.nixosModules.auth-keys-hub ];

  programs.ssh.startAgent = true;
  
  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  programs.auth-keys-hub = {
    enable = true;
    github = {
      users = [ "moons-14:moons" ];
    };
  };
}
