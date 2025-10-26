{ pkgs, ... }:
{
    home.packages = with pkgs; [
        htop
        git
    ];
    
    programs.zsh.enable = true;
    
    programs.git = {
        enable = true;
        userName = "moons-14";
        userEmail = "moons@moons14.com";
        extraConfig = { init.defaultBranch = "main"; };
    };
}
