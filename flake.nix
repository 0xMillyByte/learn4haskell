{
  description = "A flake for learn4haskell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [
        (pkgs.haskellPackages.ghcWithPackages (hps: [
          hps.cabal-install
          hps.haskell-language-server
        ]))
        pkgs.hlint
        pkgs.ormolu
      ];
    };
  };
}
