{ pkgs }:
{
    packages = with pkgs; [
        nodejs_22
        pnpm
        corepack
        git ripgrep fd fzf
    ];
    
    shellHook = ''
        echo "Web dev sell ready: node $(node -v)"
    '';
}
