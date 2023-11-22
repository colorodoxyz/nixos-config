{ config, lib, pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };
  };

  #environment.etc."current-system-packages".text =

  /*
  let
     packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
     sortedUnique = builtins.sort builtins.lessThan (lib.unique packages);
     formatted = builtins.concatStringsSep "\n" sortedUnique;
  in
    formatted;
  */

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    localstack
    tmux
    tor-browser
    ranger
    keepassxc
    xclip
    gzip
    nodejs
    google-chrome
    gotop
    nodePackages.aws-cdk
    flameshot
    libreoffice
    tmate
    tailscale
    firefox
    spotify
    go_1_21
    rustc
    cargo
    zig
    lxappearance
    steam
    gcc
    gdb
    wireguard-tools
    neovim
    os-prober
    wget
    gitFull
    ripgrep
    lsof
    i3
    kitty
    pulseaudioFull
    paprefs
    pavucontrol
    discord
    vlc
    efibootmgr
    gnumake
    qemu
    jq
    qbittorrent
    signal-desktop
    awscli2
    python3
    python311Packages.pip
    poetry
    neofetch
    slack
  ];

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
}
