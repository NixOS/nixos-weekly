/*

 To build, use the following command:

 nix-build --argstr current_timestamp `date -u +%Y-%m-%dT%TZ`

*/
{ pkgs ? import <nixpkgs> {}
, current_timestamp  # date -u +%Y-%m-%dT%TZ
}:

with builtins;

let lib = import ./lib.nix { inherit pkgs; };
  in with lib;

let

  # global configuration
  conf = import ./conf.nix;

  state = { inherit current_timestamp; };

  templates = import ./templates.nix { inherit conf state lib; };

  posts = getPosts conf.postsDir;

  pages =
    let
      chunks =
        [(take conf.postsOnIndexPage posts)] ++
        (if conf.postsPerArchivePage == null
          then [(drop conf.postsOnIndexPage posts)]
          else chunksOf conf.postsPerArchivePage (drop conf.postsOnIndexPage posts));
    in
      [{
        name = "index.html";
        nextPage = if length chunks > 1 then "archive1.html" else null;
        posts = head chunks;
        prevPage = null;
        template = templates.index;
      }]
      ++
      imap (i: chunk: {
        name = "archive${toString i}.html";
        nextPage =
          if length chunks > i + 1 then "archive${toString (i + 1)}.html" else null;
        posts = chunk;
        prevPage =
          if i == 1
            then "index.html"
            else "archive${toString (i - 1)}.html";
        template = templates.archive;
      }) (tail chunks);


in pkgs.runCommand "nixos-weekly" {} ''
  mkdir -p $out


  for file in ${conf.staticDir}/*; do
    ln -s $file $out/
  done

  ${concatMapStrings (page: ''
    ln -s ${pkgs.writeText "nixos-weekly-${page.name}" (page.template page)} $out/${page.name}
  '') pages}

  ${concatMapStringsSep "\n" (post: ''
    mkdir -p `dirname $out/${post.href}`
    ln -s ${pkgs.writeText "nixos-weekly-post.html" (templates.post.full post) } $out/${post.href}
  '') posts}

  ln -s ${pkgs.writeText "nixos-weekly-atom.xml" (templates.atom posts)} $out/atom.xml

  echo "${conf.siteUrl}" > $out/CNAME
  sed -i -e "s|https://||" $out/CNAME
  sed -i -e "s|http://||" $out/CNAME

  touch $out/.nojekyll
''
