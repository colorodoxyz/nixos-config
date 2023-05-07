{ config, ... }:

{
  # Setup audio
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };
  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
  users.extraUsers.colorodo.extraGroups = [ "audio" ];
}
