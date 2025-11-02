{ pkgs, lib, ... }:

let
  noctaliaLock = "noctalia-shell ipc call sessionMenu lockAndSuspend";

  dpmsOff = "${pkgs.niri}/bin/niri msg action power-off-monitors";
  dpmsOn  = "${pkgs.niri}/bin/niri msg action power-on-monitors";
in
{
  services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";

    timeouts = [
      { timeout = 300; command = noctaliaLock; }

      { timeout = 306; command = dpmsOff; resumeCommand = dpmsOn; }
    ];

    events = [
      { event = "lock";         command = noctaliaLock; }
      { event = "before-sleep"; command = noctaliaLock; }
      { event = "after-resume"; command = dpmsOn; }
    ];
  };
}
