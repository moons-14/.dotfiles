{ pkgs, lib, ... }:
{
    nixpkgs.config = {
        allowUnfreePredicate = pkg: lib.elem (lib.getName pkg) [ "google-chrome" "vscode" ];
    };
    
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
        jack.enable = true;
    };
    
    environment.systemPackages = with pkgs; [
         google-chrome
         vscode
    ];
}
