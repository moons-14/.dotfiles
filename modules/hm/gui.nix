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
    home.file.".config/fcitx5/config" = {
        recursive = true;
        source = ./fcitx5/config;
    };

    i18n.inputMethod.fcitx5.settings.inputMethod = {
        GroupOrder = {
            "0" = "Default";
        };
        "Groups/0" = {
            Name = "Default";
            "Default Layout" = "jp";
            DefaultIM = "mozc";
        };
        "Groups/0/Items/0" = {
            Name = "ja";
            Layout = "";
        };
        "Groups/0/Items/1" = {
            Name = "mozc";
            Layout = "";
        };
    };
}
