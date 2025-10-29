{ pkgs, lib, ... }:
let
  walls = pkgs.fetchFromGitHub {
    owner = "orangci";
    repo  = "walls-catppuccin-mocha";
    rev   = "40912e6418737e93b59a38bcf189270cbf26656d";
    hash  = "sha256-1QR3J+wgLVNjucPSVELv0FicNt+jM2KPLU5ubBfxjHI=";
  };
in {
  home.file."wallpapers" = {
    source = walls;
    recursive = true;
  };

  home.file.".local/bin/set-wallpaper.sh" = {
    source = ./set-wallpaper.sh;
    executable = true;
  };

  home.packages = with pkgs; [
    swww
    bash
    findutils
    coreutils
  ];

  systemd.user.services.swww = {
    Unit = {
      Description = "swww init (Wayland wallpaper daemon)";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = [ "${pkgs.swww}/bin/swww" "init" ];
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.services."wallpaper-rotate" = {
    Unit = {
      Description = "Rotate wallpaper via swww";
      After = [ "swww.service" "graphical-session.target" ];
      Wants = [ "swww.service" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = [ "${pkgs.bash}/bin/bash" "${config.home.homeDirectory}/.local/bin/set-wallpaper.sh" ];
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.timers."wallpaper-rotate" = {
    Unit = {
      Description = "Change wallpaper every 1 minute";
    };
    Timer = {
      OnBootSec = "30s";
      OnUnitActiveSec = "1min";
      Unit = "wallpaper-rotate.service";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
