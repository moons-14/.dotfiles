{ pkgs, inputs, ... }:
{
  # import the home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    colors = {
      # you must set ALL of these
      mError = "#dddddd";
      mOnError = "#111111";
      mOnPrimary = "#111111";
      mOnSecondary = "#111111";
      mOnSurface = "#828282";
      mOnSurfaceVariant = "#5d5d5d";
      mOnTertiary = "#111111";
      mOutline = "#3c3c3c";
      mPrimary = "#aaaaaa";
      mSecondary = "#a7a7a7";
      mShadow = "#000000";
      mSurface = "#111111";
      mSurfaceVariant = "#191919";
      mTertiary = "#cccccc";
    };
    settings = {
      # configure noctalia here; defaults will
      # be deep merged with these attributes.
      bar = {
        density = "compact";
        position = "top";
        showCapsule = true;
        widgets = {
          left = [
            {
              id = "SidePanelToggle";
              useDistroLogo = true;
            }
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
              alwaysShowPercentage = true;
              id = "Battery";
              warningThreshold = 30;
            }
            {
              id = "Volume";
            }
            {
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
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Monochrome";
      general = {
        avatarImage = "/home/drfoobar/.face";
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = true;
        name = "Tokyo";
      };
      wallpaper = {
        enabled = false;
      };
    };
    # this may also be a string or a path to a JSON file,
    # but in this case must include *all* settings.
  };
}