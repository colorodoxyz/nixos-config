{
  # Setup mouse
  services.xserver.libinput.mouse = {
    accelSpeed = "0";
  };
  #xsession.initExtra = "xinput set-prop 10 285 8";
}
