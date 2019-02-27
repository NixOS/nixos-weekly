# to update: $ nix-prefetch-url --unpack url
import (builtins.fetchTarball {
   url = "https://github.com/NixOS/nixpkgs/archive/54568a7cafb8538220fa04b93e9a038a314b65df.tar.gz";
   sha256 = "0sdhizxcp7vzsipbffx3npns23lfgdhxwkiawmi3msl50dxmc8p1";
}) { config = {}; overlays = []; }
