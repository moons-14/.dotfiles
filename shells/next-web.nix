{ pkgs }:
let
  node = pkgs.nodejs_22;
in
pkgs.mkShell {
  name = "next-web";

  packages = with pkgs; [
    node
    pnpm
    zsh
  ];

  NODE_ENV = "development";

  COREPACK_HOME = "$PWD/.corepack";

  shellHook = ''
    set -e

    # ---- show tool versions
    if command -v node >/dev/null; then
      echo "🌱 next-web shell → node $(node -v)"
    fi
    if command -v pnpm >/dev/null; then
      echo "   pnpm $(pnpm --version)"
    fi
    if command -v corepack >/dev/null 2>&1; then
      echo "   corepack available"
      if [ -f package.json ] && command -v jq >/dev/null 2>&1 && jq -e '.packageManager' package.json >/dev/null; then
        COREPACK_ENABLE_DOWNLOADS=1 corepack prepare --activate || true
      fi
    fi

    # ---- switch to zsh (interactive only). Don't break `nix develop -c ...`
    if [ -z "''${ZSH_VERSION:-}" ] && [[ $- == *i* ]] && [ -t 1 ] && [ -z "''${NIX_SHELL_ZSH_ACTIVATED:-}" ]; then
      export NIX_SHELL_ZSH_ACTIVATED=1
      exec ${pkgs.zsh}/bin/zsh -i
    fi
  '';
}
