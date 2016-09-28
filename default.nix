/*

 To build, use the following command:

 nix-build --argstr current_timestamp `date -u +%Y-%m-%dT%TZ`

*/
{ pkgs ? import <nixpkgs> {}
, current_timestamp  # date -u +%Y-%m-%dT%TZ
}:

with pkgs.lib;
with builtins;

let

  # global configuration
  conf = import ./conf.nix;

  state = { inherit current_timestamp; };

  templates = import ./templates.nix { inherit conf state; lib = pkgs.lib // { inherit prettyTimestamp; };  };

  markdown = pkgs.callPackage ({ stdenv, fetchzip }: stdenv.mkDerivation {
    name = "markdown-1.0.1";
    src = fetchzip {
      url = http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip;
      sha256 = "1mic1v7cliz59h04pj1gw001wzh346aw3dvb266agj706bg79kdf";
    };
    phases = [ "installPhase" ];
    installPhase = ''
      mkdir -p $out/bin
      cp $src/Markdown.pl $out/bin/markdown
      sed -i '1s:/usr/bin/perl:${pkgs.perl}/bin/perl:' $out/bin/markdown
    '';
  }) {};

  prettyTimestamp = timestamp:
    let
      year = substring 0 4 timestamp;
      day = substring 8 2 timestamp;
      month' = substring 5 2 timestamp;
      month =
             if month' == "01" then "JAN"
        else if month' == "02" then "FEB"
        else if month' == "03" then "MAR"
        else if month' == "04" then "APR"
        else if month' == "05" then "MAY"
        else if month' == "06" then "JUN"
        else if month' == "07" then "JUL"
        else if month' == "08" then "AUG"
        else if month' == "09" then "SEP"
        else if month' == "10" then "OKT"
        else if month' == "11" then "NOV"
        else if month' == "12" then "DEC"
        else abort "Unknown month (${month'}) for date (${timestamp}).";
    in
      "${day} ${month} ${year}";

  parsePost = filename:
    let
      result = match "(....-..-..)-(.*)\.md" filename;
      timestamp = elemAt result 0;
      id = elemAt result 1;
      path = "${conf.postsDir}/${filename}";
      year = substring 0 4 timestamp;
      href = "posts/${timestamp}-${id}.html";
      html = pkgs.runCommand "${timestamp}.html" {} ''
        ${markdown}/bin/markdown < ${path} > $out
      '';
      title = readFile (pkgs.runCommand "${timestamp}-${id}.title" {} ''
        ${pkgs.xidel}/bin/xidel ${html} -e "//h1[1]/node()" -q > $out
        echo -n `tr -d '\n' < $out` > $out
      '');
    in
      if result == null then
        abort "Post (${filename}) not in correct form (YYYY-MM-DD-<id>.md)."
      else if title == "" then
        abort "Post (${filename}) does not include title (h1)."
      else
        {
          inherit timestamp href title id;
          html = readFile html;
        };

  posts =
    sort
      (a: b: lessThan b.timestamp a.timestamp)
      (filter (x: x != null)
             (map parsePost
                  (attrNames (filterAttrs (_: v: v == "regular")
                             (readDir conf.postsDir)))));

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

  chunksOf = k:
    let
      f = ys: xs:
        if xs == []
          then ys
          else f (ys ++ [(take k xs)]) (drop k xs);
    in
      f [];


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
