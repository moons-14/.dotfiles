{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          esbenp.prettier-vscode
          dracula-theme.theme-dracula
        ];

         userSettings = {
          "workbench.colorTheme" = "Dracula";
          "window.autoDetectColorScheme" = false;
        };
      };
    };
  };
}
