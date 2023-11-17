{ config, pkgs, ... }:

{
  # Setup audio
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };
  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
}
