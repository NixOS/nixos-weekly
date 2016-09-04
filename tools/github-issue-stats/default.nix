{ pkgs ? import <nixpkgs> {} }:
let

  inherit (pkgs.python3Packages) buildPythonPackage;

in buildPythonPackage {
  name = "github-issue-stats";
  src = ./src;

  preBuild = ''
    flake8 $src
  '';

  buildInputs = with pkgs.python3Packages; [
    flake8
  ];

  propagatedBuildInputs = with pkgs.python3Packages; [
    requests2
    dateutil
  ];

}
