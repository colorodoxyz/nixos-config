{
  description = "colorodo's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence/master";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit self inputs; };
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./environment.nix
        ./audio.nix
        ./bash.nix
        ./boot.nix
        ./environment.nix
        ./video.nix
        ./git.nix
        ./home.nix
        #./kitty.nix
        #./spacevim.nix
        #./host.nix
        #./mouse.nix
	inputs.home-manager.nixosModules.home-manager
	inputs.impermanence.nixosModules.impermanence
      ];
    };
  };
}
