let
  fetchTarball = { url, sha256 }@attrs:
    if builtins.lessThan builtins.nixVersion "1.12"
    then builtins.fetchTarball { inherit url; }
    else builtins.fetchTarball attrs;
in import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/b619e0b016c5c79920aa06b78ccf936e56eaf45d.tar.gz";
  sha256 = "1bvnw9dvcbm69s9xbb2npx42zns6zq7jwang8d865pnzb0clf5sv";
}) { config = {}; overlays = []; }
