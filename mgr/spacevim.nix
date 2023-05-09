{ pkgs, ... }:

let
  inherit (pkgs) fetchFromGitHub;

  spacevim =
    fetchFromGitHub {
      owner = "SpaceVim";
      repo = "SpaceVim";
      rev = "763045513d6227a59bdb2a3a772740c3be97ac01";
      sha256 = "763045513d6227a59bdb2a3a772740c3be97ac01";
    };

in
{
  # extraConfig isn't yet supported.
  programs.neovim = {
    enable = true;
    configure = {
      customRC = "source ~/.vim/init.vim";
    };
    viAlias = true;
    vimAlias = true;
  };

  home.file = {
    ".SpaceVim.d/init.toml".source = ../config/SpaceVim.toml;
    #".SpaceVim.d/autoload/ben.vim".source = ../config/ben.vim;

    ".config/nvim" = {
      source = spacevim;
      recursive = true;
    };

    ".vim" = {
      source = spacevim;
      recursive = true;
    };
  };
}

