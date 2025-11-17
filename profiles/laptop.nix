{ ... }:
{
  imports = [
    ./gui.nix
    ./../modules/core/fingerprint.nix
    ./../modules/core/power.nix
  ];

  home-manager.users.moons.imports = [
    
  ];
}