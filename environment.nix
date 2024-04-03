{ config, lib, pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      DEFAULT_BROWSER = "firefox";
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
  environment.systemPackages = [
    pkgs.vscode
    pkgs.element-desktop
    pkgs.xournalpp
    pkgs.pulumi
    pkgs.s5cmd
    pkgs.rclone
    pkgs.sbt
    pkgs.tmux
    pkgs.tor-browser
    pkgs.ranger
    pkgs.keepassxc
    pkgs.xclip
    pkgs.gzip
    pkgs.nodejs
    pkgs.gotop
    pkgs.nodePackages.aws-cdk
    pkgs.flameshot
    pkgs.libreoffice
    pkgs.tmate
    pkgs.tailscale
    pkgs.firefox
    pkgs.spotify
    pkgs.go_1_21
    pkgs.rustc
    pkgs.cargo
    pkgs.zig
    pkgs.lxappearance
    pkgs.steam
    pkgs.gcc
    pkgs.gdb
    pkgs.wireguard-tools
    pkgs.neovim
    pkgs.os-prober
    pkgs.wget
    pkgs.gitFull
    pkgs.ripgrep
    pkgs.lsof
    pkgs.i3
    pkgs.kitty
    pkgs.pulseaudioFull
    pkgs.paprefs
    pkgs.pavucontrol
    pkgs.discord
    pkgs.vlc
    pkgs.efibootmgr
    pkgs.gnumake
    pkgs.qemu
    pkgs.jq
    pkgs.qbittorrent
    pkgs.signal-desktop
    pkgs.awscli2
    pkgs.python3
    pkgs.python311Packages.pip
    pkgs.poetry
    pkgs.neofetch
    pkgs.slack
    pkgs.kubectl
    pkgs.kubectx
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
