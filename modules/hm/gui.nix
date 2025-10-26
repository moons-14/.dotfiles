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
}
