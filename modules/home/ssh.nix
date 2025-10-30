{ config, lib, pkgs, ... }:
{

  home.packages = [ pkgs.openssh ];

  home.activation.generateSshKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    key="$HOME/.ssh/id_ed25519"
    if [ ! -f "$key" ]; then
      umask 077
      mkdir -p "$HOME/.ssh"
      ssh-keygen -t ed25519 -N "" -f "$key" \
        -C "${config.home.username}@$(hostnamectl --static)"
      echo "Generated SSH key at $key"
      echo "Public key:"
      cat "$key.pub"
    fi
  '';
}
