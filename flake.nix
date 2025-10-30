{
    description = "moons nix configurations and development shells";

    inputs = {
        nixpkgs.url          = "github:NixOS/nixpkgs/nixos-25.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nixos-hardware.url   = "github:NixOS/nixos-hardware/master";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        vicinae.url          = "github:vicinaehq/vicinae";
        ghostty.url          = "github:ghostty-org/ghostty";
        inputs.auth-keys-hub.url = "github:input-output-hk/auth-keys-hub";

        quickshell = {
            url = "github:outfoxxed/quickshell";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        noctalia = {
            url = "github:noctalia-dev/noctalia-shell";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.quickshell.follows = "quickshell";
        };
        stylix = {
            url = "github:nix-community/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixos-hardware, home-manager, ...}:
    let
        mkSystem = { host, system, profile, extraModules ? [ ] }:
            nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = {
                    inherit inputs;
                    inherit host;
                    inherit profile;
                };
                modules = [
                    ./modules/core
                    ./profiles/${profile}.nix
                    ./hosts/${host}
                ] ++ extraModules;
            };
    in {
        nixosConfigurations = {
            x1g9 = mkSystem {
                host = "x1g9";
                system = "x86_64-linux";
                profile = "laptop";
                extraModules = [ ];
            };
        };
        
        devShells = {
           x86_64-linux = {
               next-web = import ./shells/next-web.nix { pkgs = import nixpkgs { system = "x86_64-linux"; }; };
           };
        };
    };
}