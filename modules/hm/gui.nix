{ pkgs, ... }:
{
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            esbenp.prettier-vscode
        ];
        userSettings = {
            "editor.formatOnSave" = true;
        };
    };

    # niri config
    home.file.".config/niri" = {
        recursive = true;
        source = ./niri;
    };

    # input method config
    home.file.".config/fcitx5/profile" = {
        recursive = true;
        source = ./fcitx5/profile;
    };
    home.file.".config/fcitx5/config" = {
        recursive = true;
        source = ./fcitx5/config;
    };
}
