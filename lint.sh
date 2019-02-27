BIN=$(nix-build nixpkgs.nix -A nodePackages_10_x.markdown-link-check)/bin/markdown-link-check

find content/2019 -type f -exec $BIN {} \;

