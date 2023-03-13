# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  # Bootloader.
  # boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };

  networking.hostId = "3082e4d6";

  # Setup audio
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };
  nixpkgs.config.pulseaudio = true;
  users.extraUsers.colorodo.extraGroups = [ "audio" ];

  programs.fuse.userAllowOther = true;

  home-manager.users.colorodo = ({pkgs, ...} : {
    imports = [inputs.impermanence.nixosModules.home-manager.impermanence];
    home.stateVersion = "23.05";
    programs.home-manager.enable = true;
    home.persistence."/persist/home/colorodo" = {
      directories = [ ".ssh"
	".config/discord"
        ".local/share/Steam"
        ".mozilla"
        ".local/share/lutris"];
      allowOther = true;
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
        "${modifier}+Return" = "exec kitty";
        "${modifier}+b" = "exec firefox";
      };
    };
  });

  hardware.nvidia.modesetting.enable = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  boot.kernelParams = [ "video=efifb:off,vesafb:off" "gfxpayload=text" ];

  environment.persistence."/persist" = {
    files = [
      "/home/colorodo/.vimrc"
      "/etc/machine-id"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  fonts.fonts = with pkgs; [
    hermit
    source-code-pro
    terminus_font
  ];

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

    #xrandrHeads = [
    #  {
    #    output = "DP-0";
    #    primary = true;
    #  }
    #  {
    #    monitorConfig = "Option \"Rotate\" \"left\"";
    #    output = "HDMI-0";
    #    primary = false;
    #  }
    #];
  };

  users.users.root.initialHashedPassword = "$6$44KyzgHx9JrLoigD$nnASBI2H/KT9xzg0McJdfZXQJAyKDjdZH3APPIHlnlW06rxdVG2e/62eCPvQy.UW2BDCwgwINr11L8DQpkwYN.";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.colorodo = {
    isNormalUser = true;
    description = "Speener";
    extraGroups = [ "networkmanager" "wheel" ];
    initialHashedPassword = "$6$44KyzgHx9JrLoigD$nnASBI2H/KT9xzg0McJdfZXQJAyKDjdZH3APPIHlnlW06rxdVG2e/62eCPvQy.UW2BDCwgwINr11L8DQpkwYN.";
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.variables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gcc
    gdb
    wireguard-tools
    vim
    os-prober
    wget
    git
    ripgrep
    lsof
    i3
    firefox
    kitty
    pulseaudioFull
    paprefs
    pavucontrol
    discord
    vlc
    grub
    efibootmgr
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
