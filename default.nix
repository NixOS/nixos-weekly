let
  _pkgs = import <nixpkgs> {};
in
{ pkgs ? import (_pkgs.fetchFromGitHub (_pkgs.lib.importJSON ./nixpkgs.json)) {}
, pkgs-python ? import (_pkgs.fetchFromGitHub (_pkgs.lib.importJSON ./nixpkgs-python.json)) { inherit pkgs; }
#, pkgs-python ? import ./../nixpkgs-python { inherit pkgs; }
}:

pkgs.stdenv.mkDerivation {
  name = "nixos-weekly";
  src =
    builtins.filterSource
      (path: type: baseNameOf path != "result")
      ./.;
  buildInputs =
    [ pkgs-python.pelican.packages.pelican
      pkgs-python.pelican.packages.livereload
    ];
  buildPhase = ''
    pelican
  '';
  installPhase = ''
    mkdir $out
    cp -R ./output/* $out/
  '';
}
