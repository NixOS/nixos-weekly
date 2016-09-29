/*

 To build, use the following command:

 nix-build --argstr current_timestamp `date -u +%Y-%m-%dT%TZ`

or with drafts preview enabled with:

 nix-build --argstr current_timestamp `date -u +%Y-%m-%dT%TZ` --arg previewMode true

*/
{ pkgs ? import <nixpkgs> {}
, current_timestamp  # date -u +%Y-%m-%dT%TZ
, previewMode ? false
}:

with builtins;

let lib = import ./lib.nix { inherit pkgs; };
  in with lib;

let

  # global configuration
  conf = import ./conf.nix;

  state = { inherit current_timestamp; };

  templates = import ./templates.nix { inherit conf state lib; };

  posts = sortPosts
            (getPosts conf.postsDir
             ++ optionals previewMode (getPosts conf.draftsDir));

  groupedPosts = groupPosts conf posts;

  pages = [ (generateIndex templates.index groupedPosts) ]
          ++ generateArchives templates.archive groupedPosts.archive;

in generateSite { inherit templates conf pages posts; }
