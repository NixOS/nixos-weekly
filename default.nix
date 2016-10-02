/*

 To build, use the following command:

 nix-build --argstr currentTimestamp `date -u +%Y-%m-%dT%TZ`

or with drafts preview enabled with:

 nix-build --argstr currentTimestamp `date -u +%Y-%m-%dT%TZ` \
           --argstr siteUrl "http://127.0.0.1:8000" \
           --arg previewMode true

*/
{ pkgs ? import <nixpkgs> {}
, currentTimestamp  # date -u +%Y-%m-%dT%TZ
, siteUrl ? null
, previewMode ? false
}:

let lib = import ./lib.nix { inherit pkgs; };
  in with lib;

let

  # global configuration
  conf = import ./conf.nix // pkgs.lib.optionalAttrs (siteUrl != null) { inherit siteUrl; };

  # state
  state = { inherit currentTimestamp; };

  # the template base environment
  templateEnv = { inherit conf state lib templates; };

  # load a template with the default environment
  loadTemplate = loadTemplateWithEnv templateEnv;

  # list of used templates
  templates = {
    base = loadTemplate "base.nix";
    archive = loadTemplate "archive.nix";
    index = loadTemplate "index.nix";
    mailchimp = loadTemplate "mailchimp.nix";
    atom = loadTemplate "atom.nix";
    post.full = loadTemplate "post.full.nix";
    post.list = loadTemplate "post.list.nix";
    post.atomList = loadTemplate "post.atom-list.nix";
  };

  # posts to generate
  posts = sortPosts
            (getPosts conf.postsDir
             ++ optionals previewMode (getPosts conf.draftsDir));

  # group posts into index and archive according to settings
  groupedPosts = groupPosts conf posts;

  # list of pages to generate
  pages = [ (generateIndex templates.index groupedPosts) ]
          ++ generateArchives templates.archive groupedPosts.archive;

in generateSite { inherit templates conf pages posts; }
