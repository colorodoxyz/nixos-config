{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Argonaut";
  };
}
