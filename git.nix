{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Spencer Liu";

    userEmail = "spencer.liu.liu@gmail.com";
    config.user = {
      Name = "Spencer Liu";
    };
  };
}
