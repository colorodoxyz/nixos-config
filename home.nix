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
                ".aws"
                ".config/pulse"
                ".config/Signal"
                ".config/discord"
                ".background_image"
                ".config/nvim"
                ".config/spotify"
                ".local/share/Steam"
                ".local/share/nvim"
                "go"
                ".mozilla"
            ];
            allowOther = true;
        };

        programs = {
            kitty = {
                enable = true;
                theme = "Argonaut";
                extraConfig = (builtins.readFile ./kitty.conf);
                #background_image = "/home/colorodo/th-1524566410.jpg";
            };
            git = {
                enable = true;
                userName = "Spencer Liu";
                userEmail = "spencer.liu.liu@gmail.com";
                extraConfig = {
                    url."git@github.com:".insteadOf = "https://github.com/";
                };
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
