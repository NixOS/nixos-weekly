let importFromGithub = import ./importFromGithub.nix; in
{ pkgs ? importFromGithub ./nixpkgs.json {}
, pkgs-python ? importFromGithub ./nixpkgs-python.json { inherit pkgs; }
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
