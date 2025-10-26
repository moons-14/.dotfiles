{
    description = "Multi host Nix(OS) + Home Manager + flake";

    inputs = {
        nixpkgs.url          = "github:NixOS/nixpkgs/nixos-25.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nixos-hardware.url   = "github:NixOS/nixos-hardware/master";
        home-manager.url     = "github:nix-community/home-manager/release-25.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        
        sops-nix.url         = "github:Mic92/sops-nix";
        impermanence.url     = "github:nix-community/impermanence";
    };
    
    outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixos-hardware, home-manager, sops-nix, impermanence, ...}:
    let
        mkSystem = { host, system, extraModules ? [ ] }:
            let 
                pkgsUnstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
            in
            nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = {
                    inherit inputs pkgsUnstable;
                };
                modules = [
                    # host config
                    ./hosts/${host}/default.nix
                    
                    # Home Manager
                    home-manager.nixosModules.home-manager
                    { home-manager.useGlobalPkgs = true; home-manager.useUserPackages = true; }
                    
                    # common NixOS module
                    ./modules/nixos/base.nix
                    ./modules/nixos/cli.nix
                    ./modules/nixos/sops.nix
                    ./modules/nixos/impermanence.nix
                ] ++ extraModules;
            };
    in {
        nixosConfigurations = {
            x1g9 = mkSystem {
                host = "x1g9";
                system = "x86_64-linux";
                extraModules = [
                    # X1 Carbon Gen 9 Hardware Profile
                    nixos-hardware.nixosModules.lenovo-thinkpad-x1-9th-gen
                    # GUI and x1g9 only App
                    ./modules/nixos/desktop.nix
                ];
            };
            
            dev-server = mkSystem {
                host = "dev-server";
                system = "x86_64-linux";
            };
        };
        
        devShells = {
           x86_64-linux = {
               next-web = import ./shells/next-web.nix { pkgs = import nixpkgs { system = "x86_64-linux"; }; };
           };
        };
    };
}