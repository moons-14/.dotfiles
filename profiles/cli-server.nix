{ ... }:
{
  imports = [
    ./cli.nix
    ./../modules/core/ssh-server.nix
  ];

  home-manager.users.moons.imports = [
    
  ];
}