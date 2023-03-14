{
  # Setup audio
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };
  nixpkgs.config.pulseaudio = true;
  users.extraUsers.colorodo.extraGroups = [ "audio" ];
}
