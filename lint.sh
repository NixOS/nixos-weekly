BIN=$(nix-build nixpkgs.nix -A nodePackages_10_x.markdown-link-check)/bin/markdown-link-check

for file in content/$(date +%Y)/*; do
  $BIN $file
done

