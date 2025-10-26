{ inputs, ... }:
{
    imports = [ inputs.sops-nix.nixosModules.sops ];
    
    # sops.age.sshKeyPaths = [];
    # sops.defaultSopsFile = ../secrest/secrets.yaml;
}
