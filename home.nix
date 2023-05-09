{ inputs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Setup home-manager
  home-manager.users.colorodo = ({pkgs, ...} : {
    imports = [
      inputs.impermanence.nixosModules.home-manager.impermanence
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

    programs = {
      kitty = {
        enable = true;
        theme = "Argonaut";
      };
      git = {
        enable = true;
        userName = "Spencer Liu";
        userEmail = "spencer.liu.liu@gmail.com";
      };

    };

    xsession.windowManager.i3.enable = true;
    xsession.windowManager.i3.config = {
      modifier = "Mod4";
      keybindings = let
        modifier = "Mod4";
      in pkgs.lib.mkOptionDefault {
        "${modifier}+j" = "focus left";
        "${modifier}+k" = "focus down";
        "${modifier}+l" = "focus up";
        "${modifier}+semicolon" = "focus right";
        "${modifier}+Shift+j" = "move left";
        "${modifier}+Shift+k" = "move down";
        "${modifier}+Shift+l" = "move up";
        "${modifier}+Shift+semicolon" = "move right";

        "${modifier}+Return" = "exec kitty";
        "${modifier}+b" = "exec firefox";

        "${modifier}+m" = "move workspace to output DP-0";
        "${modifier}+Shift+m" = "move workspace to output HDMI-0";
      };
    };
  });
}
