{ ... }:
{
  imports = [
    ./cli.nix
    ./../modules/core/niri.nix
    ./../modules/core/hyprland.nix
    ./../modules/core/greetd.nix
    ./../modules/core/browser.nix
  ];

  home-manager.users.moons.imports = [
    ./../modules/home/vscode.nix
  ];
}