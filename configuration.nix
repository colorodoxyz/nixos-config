# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  #options.boot.initrd.systemd.dbus.enable = true;
  #options.services.dbus.enable = true;

  services.logind.extraConfig = ''
    HandlePowerKey=ignore
  '';

/*
  nixpkgs.overlays = [ (final: prev: {
    xz = prev.xz.overrideAttrs (old: {
      src = prev.fetchurl {
        url = "mirror://sourceforge/lzmautils/xz-5.4.6.tar.bz2";
        sha256 = "sha256-kThRsnTo4dMXgeyUnxwj6NvPDs9uc6JDbcIXad0+b0k=";
      };
    });
  }) ];
  */

  systemd.services.NetworkManager-wait-online.enable = false;
  networking.hostId = "3082e4d6";

  virtualisation.docker.enable = true;

  #security.apparmor.enable = true;

  #config.services.dbus.enable = true;

  programs.fuse.userAllowOther = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  services.plex = {
    enable = true;
    openFirewall = false;
  };

  services.tailscale.enable = true;
  /*
  services.tor = {
    enable = true;
    openFirewall = true;
    relay = {
      enable = true;
      role = "relay";
    };
    settings = {
      ORPort = 9001;
      ControlPort = 9051;
      BandWidthRate = "1 MBytes";
    };
  };
  */

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

  users.users.root.initialHashedPassword = inputs.piss.password;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.colorodo = {
    isNormalUser = true;
    description = "Speener";
    extraGroups = [
      "networkmanager"
      "wheel"
      "workspace"
      "docker"
      "audio"
    ];
    initialHashedPassword = inputs.piss.password;
    packages = with pkgs; [];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    #pinentryFlavor = "curses";
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;
  #services.openssh.authorizedKeysFiles = [".ssh/authorized_keys"];
  #services.openssh.passwordAuthentication = false; # originally true
  #services.openssh.permitRootLogin = "yes";
  #services.openssh.challengeResponseAuthentication = false;

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
