{
  boot.supportedFilesystems = ["ntfs"];

  # Bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      version = 2;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
  };

  boot.kernelParams = [ "video=efifb:off,vesafb:off" "gfxpayload=text" ];
}
