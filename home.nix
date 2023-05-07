{ inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Setup home-manager
  home-manager.users.colorodo = ({pkgs, ...} : {
    imports = [
      inputs.impermanence.nixosModules.home-manager.impermanence
      ./mgr/i3.nix
      #./kitty.nix
      #./mgr/kitty.nix
    ];
    home.stateVersion = "23.05";
    programs.home-manager.enable = true;
    home.persistence."/persist/home/colorodo" = {
      directories = [
        ".ssh"
        ".vim"
        #".SpaceVim"
        #".config/kitty"
        ".config/pulse"
        ".config/Signal"
        ".config/Slack"
	".config/discord"
        ".config/spotify"
        ".local/share/Steam"
        ".mozilla"
      ];
      allowOther = true;
    };
  });
}
