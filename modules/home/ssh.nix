{ config, lib, pkgs, ... }:
{

  home.packages = [ pkgs.openssh ];

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
        AddKeysToAgent yes
        IdentityFile ~/.ssh/id_ed25519
    '';
  };

  home.activation.generateSshKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    key="$HOME/.ssh/id_ed25519"
    if [ ! -f "$key" ]; then
      umask 077
      mkdir -p "$HOME/.ssh"
      ${pkgs.openssh}/bin/ssh-keygen -t ed25519 -N "" -f "$key" \
        -C "moons@$(hostnamectl --static 2>/dev/null || echo host)"
      echo "Generated SSH key at $key"
    fi
  '';

  programs.git = {
    enable = true;

    signing = {
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    extraConfig = {
      gpg.format = "ssh";
      tag.gpgSign = true;
    };
  };
}
