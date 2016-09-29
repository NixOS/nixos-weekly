{ pkgs }:

with pkgs.lib;
with builtins;

let
  markdown = pkgs.callPackage ({ stdenv, fetchzip }: stdenv.mkDerivation {
    name = "markdown-1.0.1";
    src = fetchzip {
      url = http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip;
      sha256 = "1mic1v7cliz59h04pj1gw001wzh346aw3dvb266agj706bg79kdf";
    };
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out/bin
      cp $src/Markdown.pl $out/bin/markdown
      sed -i '1s:/usr/bin/perl:${pkgs.perl}/bin/perl:' $out/bin/markdown
    '';
  }) {};
in

pkgs.lib // rec {

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
        else if month' == "10" then "OCT"
        else if month' == "11" then "NOV"
        else if month' == "12" then "DEC"
        else abort "Unknown month (${month'}) for date (${timestamp}).";
    in
      "${day} ${month} ${year}";

  /* Parse a post file into a post attribute set.

     A post attribute set consist in the following attributes:

     - timestamp: timestamp part of the post filename
     - href: relative URL to the post
     - title: post title
     - id: name part of the post file name
     - html: post content in HTML format
  */
  parsePost = postsDir: filename:
    let
      result = match "(....-..-..)-(.*)\.md" filename;
      timestamp = elemAt result 0;
      id = elemAt result 1;
      path = "${postsDir}/${filename}";
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

  /* Get all the posts from a directory as post attribute sets
  */
  getPosts = postsDir:
    (filter (x: x != null)
           (map (parsePost postsDir)
                (attrNames (filterAttrs (_: v: v == "regular")
                           (readDir postsDir)))));

  /* Sort a list of posts
  */
  sortPosts = sort (a: b: lessThan b.timestamp a.timestamp);

  chunksOf = k:
    let
      f = ys: xs:
        if xs == []
          then ys
          else f (ys ++ [(take k xs)]) (drop k xs);
    in
      f [];

  generateSite = { conf, templates, pages, posts }:
    pkgs.runCommand conf.siteId {} ''
      mkdir -p $out

      for file in ${conf.staticDir}/*; do
        ln -s $file $out/
      done

      ${concatMapStrings (page: ''
        ln -s ${pkgs.writeText "${conf.siteId}-${page.name}" (page.template page)} $out/${page.name}
      '') pages}

      ${concatMapStringsSep "\n" (post: ''
        mkdir -p `dirname $out/${post.href}`
        ln -s ${pkgs.writeText "${conf.siteId}-post-${post.id}.html" (templates.post.full post) } $out/${post.href}
      '') posts}

      ln -s ${pkgs.writeText "${conf.siteId}-atom.xml" (templates.atom posts)} $out/atom.xml

      echo "${conf.siteUrl}" > $out/CNAME
      sed -i -e "s|https://||" $out/CNAME
      sed -i -e "s|http://||" $out/CNAME

      touch $out/.nojekyll
    '';
}
