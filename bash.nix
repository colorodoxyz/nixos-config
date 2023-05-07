{
  programs.bash.shellAliases = {
    gs="git status";
    gc="git commit";
    gd="git diff";
    gb="git branch";
    gl="git pull";
    gu="git push";
    gadd="git add";
    gcheck="git checkout";
    la="ls -lhA";
    nxrb="sudo nixos-rebuild switch --flake /persist/nixConfig#nixos";
  };
}
