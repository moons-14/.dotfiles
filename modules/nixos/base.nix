{ pkgs, lib, ... }:
{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    time.timeZone = "Asia/Tokyo";
    i18n.defaultLocale = "ja_JP.UTF-8";
    
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
}
