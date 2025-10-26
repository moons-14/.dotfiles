{ pkgs, lib, ... }:
{
    nixpkgs.config = {
        allowUnfreePredicate = pkg: lib.elem (lib.getName pkg) [ "google-chrome" "vscode" ];
    };
    
    services.xserver.enable = true;

    # enable niri
    programs.niri.enable = true;
    
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
        jack.enable = true;
    };

    services.greetd ={
        enable = true;
        settings = {
            default_session = {
                    command = "tuigreet --time --remember --cmd niri";
                    user = "greeter";
            };
        };
    };
    
    environment.systemPackages = with pkgs; [
        greetd.tuigreet
        alacritty
        fuzzel
        swaybg
        xwayland-satellite
        google-chrome
        vscode
        fcitx5 fcitx5-mozc
    ];

    environment.sessionVariables = {
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        QT_QPA_PLATFORM = "wayland;xcb";
    };

    i18n.inputMethod = {
        enabled = "fcitx5";
        fcitx5 = {
            addons = with pkgs; [
                fcitx5-mozc
                fcitx5-gtk
                fcitx5-configtool
            ];
        };
    };
}
