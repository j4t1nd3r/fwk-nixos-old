{
  description = "nixos flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    # hyprland = {
    #   url = "github:hyprwm/hyprland";
    #   inputs.systems.follows = "systems";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, plasma-manager, ... }@inputs:
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
        inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
