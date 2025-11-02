{ ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      input.touchpad = { 
        natural-scroll = true;
        scroll-method = "two-finger";
        click-method = "clickfinger";
      };
      
      # Doracura color
      layout = {
        focus-ring = {
          active.color = "#bd93f9" ;
          inactive.color = "#6272a4";
        };
        border = {
          active.color = "#ffc87f" ;
          inactive.color = "#505050";
          urgent.color = "#9b0000";
        };
        shadow = {
          color = "#0007";
        };
      };

      binds = {
        "Mod+T" = {
          action.spawn = "ghostty";
          hotkey-overlay.title = "Open a Terminal: ghostty";
        };
        "Mod+D" = {
          action.spawn = [ "vicinae" "toggle"];
          hotkey-overlay.title = "Run an Application: vicinae";
        };
        "Super+Alt+L" = {
          action.spawn = "noctalia-shell" "ipc" "call" "lockScreen" "lock";
          hotkey-overlay.title = "Lock the Screen: noctalia";
        };
        
        "XF86AudioRaiseVolume" = {
          action.spawn = "noctalia-shell" "ipc" "call" "volume" "increase";
        };
        "XF86AudioLowerVolume" = {
          action.spawn = "noctalia-shell" "ipc" "call" "volume" "decrease";
        };
        "XF86AudioMute" = {
          action.spawn = "noctalia-shell" "ipc" "call" "volume" "muteOutput";
        };
        "XF86AudioMicMute" = {
          action.spawn = "noctalia-shell" "ipc" "call" "volume" "muteInput";
        };
        
        "XF86MonBrightnessUp" = {
          action.spawn = "noctalia-shell" "ipc" "call" "brightness" "increase";
        };
        "XF86MonBrightnessDown" = {
          action.spawn = "noctalia-shell" "ipc" "call" "brightness" "decrease";
        };
      };
    };
  };
}