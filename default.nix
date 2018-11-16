{ pkgs ? import ./nixpkgs.nix
}:

pkgs.stdenv.mkDerivation {
  name = "nixos-weekly";
  src =
    builtins.filterSource
      (path: type: baseNameOf path != "result")
      ./.;
  buildInputs = with pkgs.python3Packages;
    [ pelican
      livereload
      markdown
    ];
  buildPhase = ''
    pelican
  '';
  installPhase = ''
    mkdir $out
    cp -R ./output/* $out/
  '';
}
