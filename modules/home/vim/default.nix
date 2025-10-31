{ lib, ... }:
{
    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        extraConfig = lib.fileContents ./init.vim;
    };
}