{
  description = "My Todo application";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          haskellPackages = pkgs.haskellPackages;

      in {

        haskellPackages = pkgs.haskellPackages;



        devShell = pkgs.mkShell {
          buildInputs = with haskellPackages; [
            haskell-language-server
            ghcid
            cabal-install
	    ghc
            haskell-language-server
            shelly
            optparse-applicative
            text

          ];


  shellHook = ''
    echo "Welcome to my to-do shell!";
  '' ;


        };
      });
}
