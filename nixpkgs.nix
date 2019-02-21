# to update: $ nix-prefetch-url --unpack url
import (builtins.fetchTarball {
   url = "https://github.com/NixOS/nixpkgs/archive/39e3248141eb2f778ef5adc7643eb36094416974.tar.gz";
   sha256 = "17l5fjpkhsr70z6p43k9b1g7flxkvcv3azwqqjsc666s44sgiw9j";
}) { config = {}; overlays = []; }
