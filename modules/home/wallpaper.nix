{ pkgs, lib, ... }:
let
  walls = pkgs.fetchFromGitHub {
    owner = "moons-14";
    repo  = "wallpapers";
    rev   = "7bb2bd7b904c497de8ceeb0213e0e9d513c8bd06";
    hash  = "sha256-/Q8tiV7iegm366/7sfJv2ze7rRNriaQilvpK+91krVY=";
  };
in {
  home.file.".wallpapers" = {
    source = walls;
    recursive = true;
  };
}
