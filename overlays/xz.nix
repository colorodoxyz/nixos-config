final: prev:{
  xz = prev.xz.overrideAttrs (old: {
    name = "xz";
    version = "5.4.6";
    src = prev.fetchurl {
      url = "mirror://sourceforge/lzmautils/xz-5.4.6.tar.bz2";
      sha256 = "sha256-kThRsnTo4dMXgeyUnxwj6NvPDs9uc6JDbcIXad0+b0k=";
    };
  });
}

    nixosConfigurations."nixos" = let pkgs = (nixpkgs.legacyPackages.${self.system}.extend (
      final: prev: {
        xz = nixpkgs-stable.legacyPackages.${self.system}.xz;
      }
    )); in nixpkgs.lib.nixosSystem {
