{ pkgs, lib, ... }:
let
  walls = pkgs.fetchFromGitHub {
    owner = "orangci";
    repo  = "walls-catppuccin-mocha";
    rev   = "40912e6418737e93b59a38bcf189270cbf26656d";
    hash  = "sha256-1QR3J+wgLVNjucPSVELv0FicNt+jM2KPLU5ubBfxjHI=";   # nix-shell -p nix-prefetch-github --run 'nix-prefetch-github orangci walls-catppuccin-mocha --rev 40912e6418737e93b59a38bcf189270cbf26656d'
  };
in {
  home.file."wallpapers" = {
    source = walls;
    recursive = true;
  };
}
