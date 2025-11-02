{ ... }:
{
  imports = [
    ./cli.nix
    ./../modules/core/niri.nix
    ./../modules/core/hyprland.nix
    ./../modules/core/greetd.nix
    ./../modules/core/noctalia.nix
    ./../modules/core/1password.nix
  ];

  home-manager.users.moons.imports = [
    ./../modules/home/vscode.nix
    ./../modules/home/browser.nix
    ./../modules/home/vicinae.nix
    ./../modules/home/noctalia.nix
    ./../modules/home/avatar.nix
    ./../modules/home/ghostty
    ./../modules/home/wallpaper.nix
    ./../modules/home/lock.nix
  ];
}