{
  description = "colorodo's NixOS Flake";

  inputs = {
    piss.url = "git+file:./passwords";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence/master";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit self inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./environment.nix
        ./audio.nix
        ./bash.nix
        ./environment.nix
        ./video.nix
        ./home.nix
	    inputs.home-manager.nixosModules.home-manager
	    inputs.impermanence.nixosModules.impermanence
      ];
    };
  };
}
