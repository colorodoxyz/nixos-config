{ inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Setup home-manager
  home-manager.users.colorodo = ({pkgs, ...} : {
    imports = [
      inputs.impermanence.nixosModules.home-manager.impermanence
      ./kitty.nix
      ./mgr/i3.nix
      #./git.nix
    ];
    home.stateVersion = "23.05";
    programs.home-manager.enable = true;
    home.persistence."/persist/home/colorodo" = {
      directories = [
        ".ssh"
        ".vim"
        #".SpaceVim"
        ".config/pulse"
        ".config/Signal"
        ".config/Slack"
	".config/discord"
        ".config/spotify"
        ".local/share/Steam"
        "go"
        ".mozilla"
      ];
      allowOther = true;
    };
  });
}
