{
  description = "nixos flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, plasma-manager, ... }@inputs:
  let
    system = "x86-64-linux";

    pkgs = import nixpkgs {
      inherit system; 

      config = {
        allowUnfree = true;
      };
    };

    in
    {
    nixosConfigurations = {
      fwk-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };

        modules = [
        ./nixos/configuration.nix
        nixos-hardware.framework-16-inch-cpu-7040-amd
        inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
