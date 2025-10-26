{ pkgs, lib, ... }:
{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    time.timeZone = "Asia/Tokyo";
    i18n.defaultLocale = "ja_JP.UTF-8";
    services.xserver.xkb.layout = "jp";
    services.xserver.xkb.variant = "";
    services.xserver.xkb.options = "ctrl:nocaps";
    console.keyMap = "jp106";
    
    # common user
    users.users.moons = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" ];
        shell = pkgs.zsh;
    };
    
    programs.zsh.enable = true;
    services.openssh.enable = true;
    
    # basic network setting
    networking.networkmanager.enable = true;

    nix.settings = {
        extra-substituters = [ "https://vicinae.cachix.org" ];
        extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];
    };
}
