{ pkgs, ... }:
let
  walls = pkgs.fetchFromGitHub {
    owner = "moons-14";
    repo  = "wallpapers";
    rev   = "a126b57cb271931b96f7e984728c95ffb104eda0";
    hash  = "sha256-BATc1Gg73pBCMem/32IQ3c2avJT1DOLANtLZbLbTka0=";
  };
in {
  home.file.".wallpapers" = {
    source = walls;
    recursive = true;
  };
}
