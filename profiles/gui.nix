{ ... }:
{
  imports = [
    ./cli.nix
    ./../modules/core/niri.nix
    ./../modules/core/hyprland.nix
    ./../modules/core/greetd.nix
  ];

  home-manager.users.moons.imports = [
    ./../modules/home/vscode.nix
    ./../modules/home/browser.nix
    ./../modules/home/vicinae.nix
  ];
}