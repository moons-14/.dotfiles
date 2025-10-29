{ pkgs, inputs, ... }:
{
  # import the home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here; defaults will
      # be deep merged with these attributes.
      bar = {
        density = "default";
        position = "top";
        showCapsule = true;
        backgroundOpacity = 0.8;
        floating = true;
        widgets = {
          left = [
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "SystemMonitor";
            }
            {
              id = "ActiveWindow";
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "MediaMini";
            }
            {
              id = "NotificationHistory";
            }
            {
              displayMode = "alwaysShow";
              id = "Battery";
              warningThreshold = 30;
            }
            {
              displayMode = "alwaysShow";
              id = "Volume";
            }
            {
              displayMode = "alwaysShow";
              id = "Brightness";
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "dracula";
      general = {
        avatarImage = "~/.face";
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = true;
        weatherEnabled = false;
        name = "Tokyo";
      };
      wallpaper = {
        enabled = true;
        directory = "~/.wallpapers/";
        defaultWallpaper = "~/.wallpapers/3d-model.jpg";
        randomEnabled = true;
        randomIntervalSec = 60;
        transitionDuration = 1500;
      };
      controlCenter = {
          position = "close_to_bar_button";
          shortcuts = {
            left = [
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "ScreenRecorder";
              }
              {
                id = "WallpaperSelector";
              }
            ];
            right = [
              {
                id = "Notifications";
              }
              {
                id = "NightLight";
              }
            ];
          };
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = true;
              id = "media-sysmon-card";
            }
          ];
        };
    };
    # this may also be a string or a path to a JSON file,
    # but in this case must include *all* settings.
  };
}