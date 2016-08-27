{ pkgs ? import <nixpkgs> {}
, postsDir ? ./posts
, styleCSS ? ./style.css
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
          <meta name="author" content="NixOS Contributors" />
          <meta name="copyright" content="NixOS Contributors" />
          <title>${title}</title>

          <!-- TODO: https://github.com/garbas/nixos-weekly/issues/7
          <link
              href="https://weekly.nixos.org/rss.xml"
              type="application/rss+xml"
              rel="alternate"
              title="This ~Week in NixOS - Full RSS Feed"
              />
          <link
              href="https://weekly.nixos.org/atom.xml"
              type="application/atom+xml"
              rel="alternate"
              title="This ~Week in NixOS - Full Atom Feed"
              />
          -->

          <link
              rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
          <link
              rel="stylesheet"
              href="/index.css">
        </head>

        <body>

          <header class="site-header">
            <div class="container wrapper">
              <a class="site-title" href="/">
                ${title}
              </a>
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
                    <li><a href="https://github.com/garbas/nixos-weekly">Source Code</a></li>
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

    index = posts:
      templates.base
        { title = "This \"Week\" in NixOS";
          content = 
            ''
              <div class="row">
                <div class="col-md-12 text-center">
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

                    ${concatMapStringsSep "\n" ({ datetime, humandate, href, title, ... }: ''
                    <li>
                      <div class="row post-title">
                        <div class="col-xs-12 col-sm-4">
                          <span class="small text-muted time-prefix">
                            <time pubdate="pubdate" datetime="${datetime}">${humandate}</time>
                          </span>
                        </div>
                        <div class="col-xs-12 col-sm-8 text-right custom-xs-text-left">
                          <a href="${href}">${title}</a>
                        </div>
                      </div>
                    </li>
                    '') posts}

                    <!-- TODO:  
                    <li class="text-right">
                      <a href="https://this-week-in-rust.org/blog/archives/index.html">View more &rarr;</a>
                    </li>
                    -->
                  </ul>
                </div>
              </div>
            '';
        };

    post = content:
      templates.base
        { title = "This \"Week\" in NixOS";
          content = ''
            <div class="post">

              <!-- XXX here is a placeholder for blog post header data -->
              <header class="post-header">
                <div class="row post-title">
                  <div class="col-xs-12 col-sm-4">
                    <span class="small text-muted time-prefix">
                      <time pubdate="pubdate" datetime="2016-08-23T00:00:00-04:00">23 AUG 2016</time>
                    </span>
                  </div>
                  <div class="col-xs-12 col-sm-8 text-right custom-xs-text-left">
                    <a href="https://this-week-in-rust.org/blog/2016/08/23/this-week-in-rust-144/">This Week in Rust 144</a>
                  </div>
                </div>
              </header>

              <article class="post-content">
                ${content}
              </article>

            </div>

            <div class="row text-center">
              <h3> Like what you see? Subscribe! </h3>
            </div>
            <div class="row">
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
                  <span class="help-block small text-muted">Receive a weekly newsletter, every Tuesday. Easy to unsubscribe and no spam, promise.</span>
                </form>
              </div>
              <div class="col-sm-1"></div>
            </div>

          '';
        };
  };


  parse-post = markdown-name: let
    result = match "(....-..-..)-(.*)\.md" markdown-name;
    date = elemAt result 0;
    title = elemAt result 1;
  in
    if result != null
      then
        rec {
          inherit title;
          markdown-path = "${postsDir}/${markdown-name}";
          href = "posts/${date}-${title}.html";
          datetime = date;
          humandate = date;
          html =
            templates.post
              (readFile (pkgs.runCommand "${date}-${title}-content.html" {} ''
                ${markdown}/bin/markdown < ${markdown-path} > $out
              ''));
        }
      else
        null;

  posts =
    filter (x: x != null)
           (map parse-post
                (attrNames (filterAttrs (_: v: v == "regular")
                           (readDir postsDir))));

in pkgs.runCommand "nixos-weekly" {} ''
  mkdir $out

  ln -s ${pkgs.writeText "nixos-weekly-index.html" (templates.index posts)} $out/index.html
  ln -s ${styleCSS} $out/index.css

  mkdir $out/posts
  ${concatMapStringsSep "\n" ({ html, href, ... }: ''
    cp ${pkgs.writeText "nixos-weekly-post.html" html} $out/${href}
  '') posts}

  touch $out/.nojekyll
    ''
