{
  # use project directory: `echo 'use flake ~/dotfiles#next-web' > .envrc`
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true; 
  };
}
