{ pkgs, inputs, ... }:
{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = false;
    };
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    adb.enable = true;
    hyprlock.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh = {
      enable = true; 
    }
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    greetd.tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    htop # Simple Terminal Based System Monitor
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    uwsm # Universal Wayland Session Manager (optional must be enabled)
    wget # Tool For Fetching Files With Links
    curl # Tool For Fetching Files With Links
    alacritty # A GPU Accelerated Terminal Emulator
    fuzzel # A Simple And Lightweight Application Launcher
    msedit # A Simple Text Editor Inspired By Windows Notepad
    git # Version Control System
  ];
}
