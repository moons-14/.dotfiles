{ pkgs, lib, ... }:
let
  walls = pkgs.fetchFromGitHub {
    owner = "orangci";
    repo  = "walls-catppuccin-mocha";
    rev   = "40912e6418737e93b59a38bcf189270cbf26656d";
    hash  = "sha256-1QR3J+wgLVNjucPSVELv0FicNt+jM2KPLU5ubBfxjHI=";
  };

  swwwScript = ./swww.sh;
in {
  home.file."wallpapers" = {
    source = walls;
    recursive = true;
  };

  home.packages = with pkgs; [
    swww
  ];

  home.file.".config/swww/swww.sh" = {
    source = swwwScript;
    executable = true;
  };

  systemd.user.services."swww-daemon" = {
    Unit = {
      Description = "SWWW daemon";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      Environment = [
        "PATH=${lib.makeBinPath [ pkgs.swww pkgs.coreutils pkgs.findutils pkgs.bash ]}:$PATH"
      ];
      ExecStart = "${pkgs.bash}/bin/bash -lc 'if swww query >/dev/null 2>&1; then exit 0; else exec swww-daemon -f xrgb; fi'";
      Restart = "on-failure";
      RestartSec = 2;
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.services."change-wallpaper" = {
    Unit = {
      Description = "Set/rotate wallpaper via swww";
      After = [ "swww-daemon.service" "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      Environment = [
        "PATH=${lib.makeBinPath [ pkgs.swww pkgs.coreutils pkgs.findutils pkgs.bash ]}:$PATH"
      ];
      ExecStart = "${pkgs.bash}/bin/bash -lc '$HOME/.config/swww/swww.sh'";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.timers."change-wallpaper" = {
    Unit = {
      Description = "Timer to change wallpapers every hour";
    };
    Timer = {
      OnCalendar = "hourly";
      Persistent = true;
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
