{ ... }:
{
  imports = [
    ./../modules/core
  ];

  home-manager.users.moons.imports = [
    ./../modules/home/zsh.nix
  ];
}