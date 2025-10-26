{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        git
        htop
        unzip wget curl
    ];
}
