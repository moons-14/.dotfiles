{ pkgs, lib, config, ... }:
let
    isDrawin = pkgs.stdenv.isDrawin;
in
{
    home.username = "moons";
    home.homeDirectory = lib.mkDefault (if isDrawin then "/Users/moons" else "/home/moons");
    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
    
    imports = [
        ../../modules/hm/cli.nix
    ];
}
