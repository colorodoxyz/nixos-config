{ pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = "vim";
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    tailscale
    firefox
    spotify
    go_1_20
    rustc
    lxappearance
    grub
    steam
    gcc
    gdb
    wireguard-tools
    vim
    neovim
    os-prober
    wget
    git
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
    docker
    gnumake
    qemu
    jq
    qbittorrent
    signal-desktop
    slack
    droidcam
    awscli
    python3
    poetry
    neofetch
    tailscale
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
