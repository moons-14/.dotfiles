{ pkgs, lib, ... }:
let
  vsc = pkgs.vscode-extensions;
  inherit (lib) recursiveUpdate;

  layers = rec {
    common = {
      extensions = with vsc; [
        dracula-theme.theme-dracula
      ];
      userSettings = {
        "workbench.colorTheme" = "Dracula";
        "window.autoDetectColorScheme" = false;
        "editor.formatOnSave" = true;
      };
    };

    web = {
      extensions = with vsc; [
        dbaeumer.vscode-eslint
      ];
      userSettings = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };

    nix = {
      extensions = with vsc; [
        bbenoist.nix
        jnoortheen.nix-ide
      ];
      userSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
      };
    };
  };

  combine = (ls:
    builtins.foldl' (acc: l: {
      extensions   = acc.extensions   ++ (l.extensions   or []);
      userSettings = recursiveUpdate acc.userSettings (l.userSettings or {});
    }) { extensions = []; userSettings = {}; } ls
  );

  #    mkProfile [layers...] { extensions = [...]; userSettings = { ... }; }
  mkProfile = layersList: extras:
    let base = combine layersList;
    in {
      extensions   = base.extensions ++ (extras.extensions or []);
      userSettings = recursiveUpdate base.userSettings (extras.userSettings or {});
    };

in {
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;

    profiles = {
      default = mkProfile [ layers.common ] { };

      nix = mkProfile [ layers.common layers.nix ] { };

      web = mkProfile [ layers.common layers.web ] { };
    };
  };
}
