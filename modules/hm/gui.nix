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
}
