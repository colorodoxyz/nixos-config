{ config, lib, pkgs, ... }:

{
  xsession.windowManager.i3.enable = true;
  xsession.windowManager.i3.config = {
  /*
    bars = [
      {
        position = "bottom";
        blocks = [];
      }
    ];
    */
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
}