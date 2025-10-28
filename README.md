# dotfiles

NixOS + Home Manager

## Pickup Software

- Window Manager: Niri
- Lancher: Vicinae
- Bar: Noctalia
- Editor: msedit, neovim, vscode
- Terminal: ghostty, oh-my-zsh

## Directory Structure

- hosts/{host-name}<br/>
  Hardware-specific configurations that abstract differences between hardware. Keep these minimal. Add new configurations when running NixOS on new hardware without existing support.
  - default.nix<br/>
    Moved from `/etc/nixos/configuration.nix`
  - hardware-configuration.nix<br/>
    Run `sudo nixos-generate-config` or moved from `/etc/nixos/hardware-configuration.nix`
  - variables.nix<br/>
    Config
- images
- modules
  - core<br/>
    Files related to NixOS configuration
  - drivers<br/>
    Files related to drivers such as GPUs
  - home<br/>
    Home-manager configuration files
- profiles<br/>
  Build configurations for each environment by combining NixOS configurations and home-manager configurations.
- shells<br/>
  Shell environment.
- wallpapers

## Inspired

- [Zaney/zaneyos](https://gitlab.com/Zaney/zaneyos)
