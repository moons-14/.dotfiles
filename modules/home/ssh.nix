{ config, lib, pkgs, ... }:
{

  home.packages = [ pkgs.openssh ];

  programs.ssh.startAgent = true;

  home.activation.generateSshKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    key="$HOME/.ssh/id_ed25519"
    if [ ! -f "$key" ]; then
      umask 077
      mkdir -p "$HOME/.ssh"
      ssh-keygen -t ed25519 -N "" -f "$key" -C "${config.home.username}@$(hostnamectl --static 2>/dev/null || echo host)"
      echo "Generated SSH key at $key"
    fi
  '';

  home.file.".ssh/config".text = ''
    Host *
      AddKeysToAgent yes
      IdentityFile ~/.ssh/id_ed25519
  '';

  programs.git = {
    enable = true;

    signing = {
      gpgFormat = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    extraConfig = {
      gpg.format = "ssh";
      commit.gpgsign = true;
      tag.gpgSign = true;
    };
  };
}
