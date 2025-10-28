{ ... }:
{
  imports = [
    ./cli-minimal.nix
    ./../modules/core/niri.nix
  ];

  home-manager.users.moons.imports = [
    ./../modules/home/vscode.nix
  ]
}