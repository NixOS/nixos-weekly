{ pkgs ? import <nixpkgs> {}
, postsDir ? ./posts
, statisDir ? ./static
, siteUrl ? "http://weekly.nixos.org"
, current_timestamp  # date -u +%Y-%m-%dT%TZ

, postsOnIndexPage ? 10

# null to have all older posts on first archive page
, postsPerArchivePage ? 100

}:

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

  templates = {
    archive =
      { nextPage
      , posts
      , prevPage
      }:
      templates.base
        { title = "This Week in NixOS";
          content =
            ''
              <div class="row">
                <div class="col-md-12">
                  <ul class="list-unstyled past-issues">
                    <li class="nav-header disabled"><h2>Past issues</h2></li>

                    ${concatMapStringsSep "\n" ({ timestamp, href, title, ... }: ''
                    <li>
                      <div class="row post-title">
                        <div class="col-xs-12 col-sm-4">
                          <span class="small text-muted time-prefix">
                            <time pubdate="pubdate" datetime="${timestamp}">${prettyTimestamp timestamp}</time>
                          </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 text-right custom-xs-text-left">
                          <a href="${href}">${title}</a>
                        </div>
                      </div>
                    </li>
                    '') posts}

                    ${optionalString (prevPage != null) ''
                      <a href="${prevPage}">&larr; newer</a>
                    ''}

                    ${optionalString (nextPage != null) ''
                      <a href="${nextPage}">older &rarr;</a>
                    ''}

                    <!-- TODO: https://github.com/NixOS/nixos-weekly/issues/8
                    <li class="text-right">
                      <a href="${siteUrl}/archives.html">View more &rarr;</a>
                    </li>
                    -->
                  </ul>
                </div>
              </div>
            '';
        };

    atom = 
      ''
        <feed xmlns="http://www.w3.org/2005/Atom"
              xmlns:planet="http://namespace.uri/"
              xmlns:indexing="urn:atom-extension:indexing"
              indexing:index="no">

          <access:restriction xmlns:access="http://www.bloglines.com/about/specs/fac-1.0" relationship="deny"/>

          <title>NixOS Weekly</title>
          <updated>${current_timestamp}</updated>
          <generator uri="${siteUrl}">NixOS Weekly</generator>
          <author>
            <name>NixOS Weekly Team</name>
            <email>weekly@nixos.org</email>
          </author>
          <id>${siteUrl}/atom.xml</id>
          <link href="${siteUrl}/atom.xml" rel="self" type="application/atom+xml"/>
          <link href="${siteUrl}" rel="alternate"/>

          ${concatMapStringsSep "\n" (
            { html, href, title, id, timestamp }:
            ''
              <entry>
                <id>${siteUrl}/${href}</id>
                <link href="${siteUrl}/${href}" rel="alternate" type="text/html"/>
                <updated>${timestamp}T00:00:00Z</updated>
                <title>${title}</title>
                <summary type="xhtml">
                  <div xmlns="http://www.w3.org/1999/xhtml">
                    ${html}
                  </div>
                </summary>
              </entry>
            ''
          ) posts}

        </feed>
      '';
    base = 
      { title
      , content
      }:
      ''
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">
          <meta name="author" content="NixOS Contributors">
          <meta name="copyright" content="NixOS Contributors">

          <link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
          <link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
          <link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
          <link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
          <link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
          <link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
          <link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
          <link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
          <link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
          <link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
          <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
          <link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
          <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
          <link rel="shortcut icon" type="image/png" href="/favicon.png">
          <link rel="manifest" href="/manifest.json">

          <meta name="msapplication-TileColor" content="#ffffff">
          <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
          <meta name="theme-color" content="#ffffff">


          <title>${title}</title>

          <link
              href="${siteUrl}/atom.xml"
              type="application/atom+xml"
              rel="alternate"
              title="This Week in NixOS - Full Atom Feed"
              />

          <link
              rel="stylesheet"
              href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
          <link
              rel="stylesheet"
              href="${siteUrl}/style.css">
        </head>

        <body>

          <header class="site-header">
            <div class="container wrapper">
              <a class="site-title" href="${siteUrl}">This Week in NixOS</a>
            </div>
          </header>

          <div class="page-content">
            <div class="container wrapper">
              ${content}
            </div>
          </div>

          <footer>
            <div class="container wrapper">
              <div class="row">
                <div class="col-sm-12 col-xs-12">
                  <ul class="list-unstyled">
                    <li><a href="https://nixos.org">NixOS</a></li>
                    <li><a href="https://github.com/nixos/nixos-weekly">Source Code</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </footer>

        </body>
        </html>
      '';

    mailchimp = ''
      <form action="//nixos.us14.list-manage.com/subscribe/post?u=24d1741146b951f90adf436fd&amp;id=cb1df4af80" method="post" novalidate>
        <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups -->
        <div class="out-of-view-input"><input type="text" name="b_24d1741146b951f90adf436fd" tabindex="-1" value=""></div>
        <div class="input-group input-group-lg">
          <input type="email" name="EMAIL" class="form-control" placeholder="Enter your email" />
          <span class="input-group-btn">
            <input type="submit" name="subscribe" class="btn btn-default btn-primary" value="Subscribe!" />
          </span>
        </div>
        <span class="help-block small text-muted">Receive a weekly newsletter, every Tuesday. Easy to unsubscribe and no spam, promise.</span>
      </form>
    '';

    index =
      { nextPage
      , posts
      , prevPage
      }:
      templates.base
        { title = "This Week in NixOS";
          content = 
            ''
              <div class="row">
                <div class="col-md-12 text-center">
                  <div class="text-center">
                    <img src="${siteUrl}/logo.png" width="200px"/>
                  </div>
                  <h1 class="pitch">Handpicked NixOS updates, <br /> delivered to your inbox.</h1>
                  <p class="subtext">Stay up to date with events, learning resources, and recent developments in NixOS community.</p>
                </div>
              </div>

              <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                  ${templates.mailchimp}
                </div>
                <div class="col-sm-1"></div>
              </div>

              <div class="row">
                <div class="col-md-12">
                  <ul class="list-unstyled past-issues">
                    <li class="nav-header disabled"><h2>Past issues</h2></li>

                    ${concatMapStringsSep "\n" ({ timestamp, href, title, ... }: ''
                    <li>
                      <div class="row post-title">
                        <div class="col-xs-12 col-sm-4">
                          <span class="small text-muted time-prefix">
                            <time pubdate="pubdate" datetime="${timestamp}">${prettyTimestamp timestamp}</time>
                          </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 text-right custom-xs-text-left">
                          <a href="${href}">${title}</a>
                        </div>
                      </div>
                    </li>
                    '') posts}

                    ${optionalString (prevPage != null) ''
                      <a href="${prevPage}">&larr; newer</a>
                    ''}

                    ${optionalString (nextPage != null) ''
                      <a href="${nextPage}">older &rarr;</a>
                    ''}

                    <!-- TODO: https://github.com/NixOS/nixos-weekly/issues/8
                    <li class="text-right">
                      <a href="${siteUrl}/archives.html">View more &rarr;</a>
                    </li>
                    -->
                  </ul>
                </div>
              </div>
            '';
        };

    post =
      { title
      , timestamp
      , href
      , html
      , id
      }:
      templates.base
        { title = "${title} - This Week in NixOS";
          content = ''
            <div class="post">

              <header class="post-header">
                <div class="text-center">
                  <time pubdate="pubdate" datetime="${timestamp}">${prettyTimestamp timestamp}</time>
                </div>
              </header>

              <article class="post-content">
                ${html}
              </article>

            </div>

            <div class="row text-center">
              <h3> Like what you see? Subscribe! </h3>
            </div>
            <div class="post row">
              <div class="col-sm-1"></div>
              <div class="col-sm-10">
                <form action="//nixos.us14.list-manage.com/subscribe/post?u=24d1741146b951f90adf436fd&amp;id=cb1df4af80" method="post" novalidate>
                  <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups -->
                  <div class="out-of-view-input"><input type="text" name="b_24d1741146b951f90adf436fd" tabindex="-1" value=""></div>
                  <div class="input-group input-group-lg">
                    <input type="email" name="EMAIL" class="form-control" placeholder="Enter your email" />
                    <span class="input-group-btn">
                      <input type="submit" name="subscribe" class="btn btn-default btn-primary" value="Subscribe!" />
                    </span>
                  </div>
                  <span class="help-block small text-muted text-center">Receive a weekly newsletter, every second Tuesday. Easy to unsubscribe and no spam, promise.</span>
                </form>
              </div>
              <div class="col-sm-1"></div>
            </div>

            <div id="disqus_thread"></div>
            <script>
            (function() { // DON'T EDIT BELOW THIS LINE
                var d = document, s = d.createElement('script');
                s.src = '//nixos-weekly.disqus.com/embed.js';
                s.setAttribute('data-timestamp', +new Date());
                (d.head || d.body).appendChild(s);
            })();
            </script>
            <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>


          '';
        };
  };

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

  posts =
    sort
      (a: b: lessThan b.timestamp a.timestamp)
      (filter (x: x != null)
             (map parsePost
                  (attrNames (filterAttrs (_: v: v == "regular")
                             (readDir postsDir)))));

  pages =
    let
      chunks =
        [(take postsOnIndexPage posts)] ++
        (if postsPerArchivePage == null
          then [(drop postsOnIndexPage posts)]
          else chunksOf postsPerArchivePage (drop postsOnIndexPage posts));
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


  for file in ${statisDir}/*; do
    ln -s $file $out/
  done

  ${concatMapStrings ({ nextPage, name, posts, prevPage, template }: ''
    ln -s ${pkgs.writeText "nixos-weekly-${name}" (template { inherit nextPage posts prevPage; })} $out/${name}
  '') pages}

  ${concatMapStringsSep "\n" ({ html, href, title, timestamp, id }: ''
    mkdir -p `dirname $out/${href}`
    ln -s ${pkgs.writeText "nixos-weekly-post.html" (templates.post { inherit title timestamp href html id; }) } $out/${href}
  '') posts}

  ln -s ${pkgs.writeText "nixos-weekly-atom.xml" templates.atom} $out/atom.xml

  echo "${siteUrl}" > $out/CNAME
  sed -i -e "s|https://||" $out/CNAME
  sed -i -e "s|http://||" $out/CNAME

  touch $out/.nojekyll
''
