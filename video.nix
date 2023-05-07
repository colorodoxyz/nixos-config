{ pkgs, ... }:

{
  hardware.nvidia.modesetting.enable = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  # Configure keymap in X11
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    layout = "us";
    xkbVariant = "";

    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };

    screenSection = ''
	Option    "nvidiaXineramaInfoOrder" "DFP-1"
	Option    "metamodes" "DP-0: nvidia-auto-select +0+240, HDMI-0: nvidia-auto-select +3440+0 {rotation=left}"
      '';
  };
}
