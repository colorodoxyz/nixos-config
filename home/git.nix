{ inputs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.Name = "Spencer Liu";
      user.Email = "spencer.liu.liu@gmail.com";
    };
  };
}
