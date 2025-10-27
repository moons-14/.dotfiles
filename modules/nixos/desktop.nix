{ pkgs, lib, ... }:
{
    nixpkgs.config = {
        allowUnfreePredicate = pkg: lib.elem (lib.getName pkg) [ 
            "google-chrome"
            "vscode"
            "1password"
            "1password-gui"
            "1password-cli"
        ];
    };
    
    services.xserver.enable = true;

    programs.hyperland.enable = true;
    
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
                    command = "tuigreet --time --remember --cmd 'uwsm start -- niri'";
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
        _1password-gui _1password
        kitty
    ];

    environment.sessionVariables = {
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        QT_QPA_PLATFORM = "wayland;xcb";
    };

    i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
            addons = with pkgs; [
                fcitx5-mozc
                fcitx5-gtk
                fcitx5-configtool
            ];
        };
    };

    programs._1password.enable = true;
    programs._1password-gui.enable = true;
}
