{ conf, state, lib }:

with lib;

let t = rec {

  templates = {

    /* 
      archive page
    */
    archive = page:
      templates.base
        { title = "This Week in NixOS";
          content =
            ''
              <div class="row">
                <div class="col-md-12">
                  <ul class="list-unstyled past-issues">
                    <li class="nav-header disabled"><h2>Past issues</h2></li>

                    ${concatMapStringsSep "\n" templates.post.list page.posts}

                    ${optionalString (page.prevPage != null) ''
                      <a href="${page.prevPage}">&larr; newer</a>
                    ''}

                    ${optionalString (page.nextPage != null) ''
                      <a href="${page.nextPage}">older &rarr;</a>
                    ''}

                    <!-- TODO: https://github.com/NixOS/nixos-weekly/issues/8
                    <li class="text-right">
                      <a href="${conf.siteUrl}/archives.html">View more &rarr;</a>
                    </li>
                    -->
                  </ul>
                </div>
              </div>
            '';
        };

    /*
      atom feed
    */
    atom = posts:
      ''
        <feed xmlns="http://www.w3.org/2005/Atom"
              xmlns:planet="http://namespace.uri/"
              xmlns:indexing="urn:atom-extension:indexing"
              indexing:index="no">

          <access:restriction xmlns:access="http://www.bloglines.com/about/specs/fac-1.0" relationship="deny"/>

          <title>NixOS Weekly</title>
          <updated>${state.current_timestamp}</updated>
          <generator uri="${conf.siteUrl}">NixOS Weekly</generator>
          <author>
            <name>NixOS Weekly Team</name>
            <email>weekly@nixos.org</email>
          </author>
          <id>${conf.siteUrl}/atom.xml</id>
          <link href="${conf.siteUrl}/atom.xml" rel="self" type="application/atom+xml"/>
          <link href="${conf.siteUrl}" rel="alternate"/>
          
          ${concatMapStringsSep "\n" templates.post.atomList posts}

        </feed>
      '';

    /*
      base layout
    */
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
              href="${conf.siteUrl}/atom.xml"
              type="application/atom+xml"
              rel="alternate"
              title="This Week in NixOS - Full Atom Feed"
              />

          <link
              rel="stylesheet"
              href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
          <link
              rel="stylesheet"
              href="${conf.siteUrl}/style.css">
        </head>

        <body>

          <header class="site-header">
            <div class="container wrapper">
              <a class="site-title" href="${conf.siteUrl}">This Week in NixOS</a>
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
                    <li><a href="https://creativecommons.org/licenses/by-sa/4.0/">CC BY-SA</a></li>
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

    /*
      index page
    */
    index = page:
      templates.base
        { title = "This Week in NixOS";
          content = 
            ''
              <div class="row">
                <div class="col-md-12 text-center">
                  <div class="text-center">
                    <img src="${conf.siteUrl}/logo.png" width="200px"/>
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

                    ${concatMapStringsSep "\n" (templates.post.list) page.posts }

                    ${optionalString (page.prevPage != null) ''
                      <a href="${page.prevPage}">&larr; newer</a>
                    ''}

                    ${optionalString (page.nextPage != null) ''
                      <a href="${page.nextPage}">older &rarr;</a>
                    ''}

                    <!-- TODO: https://github.com/NixOS/nixos-weekly/issues/8
                    <li class="text-right">
                      <a href="${conf.siteUrl}/archives.html">View more &rarr;</a>
                    </li>
                    -->
                  </ul>
                </div>
              </div>
            '';
        };

    /*
     post templates

       post templates are declined in mutiple variations
    */
    post = {

      /*
        full page post
      */
      full = post:
        templates.base
          { title = "${post.title} - This Week in NixOS";
            content = ''
              <div class="post">
  
                <header class="post-header">
                  <div class="text-center">
                    <time pubdate="pubdate" datetime="${post.timestamp}">${prettyTimestamp post.timestamp}</time>
                  </div>
                </header>
  
                <article class="post-content">
                  ${post.html}
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

      /*
        list view of a post
      */
      list = post:
        ''
          <li>
            <div class="row post-title">
              <div class="col-xs-12 col-sm-4">
                <span class="small text-muted time-prefix">
                  <time pubdate="pubdate" datetime="${post.timestamp}">${prettyTimestamp post.timestamp}</time>
                </span>
              </div>
              <div class="col-xs-12 col-sm-8 text-right custom-xs-text-left">
                <a href="${post.href}">${post.title}</a>
              </div>
            </div>
          </li>
        '';

      /*
        list view of a post in atom format
      */
      atomList = post:
        ''
          <entry>
            <id>${conf.siteUrl}/${post.href}</id>
            <link href="${conf.siteUrl}/${post.href}" rel="alternate" type="text/html"/>
            <updated>${post.timestamp}T00:00:00Z</updated>
            <title>${post.title}</title>
            <summary type="xhtml">
              <div xmlns="http://www.w3.org/1999/xhtml">
                ${post.html}
              </div>
            </summary>
          </entry>
        '';

    };
  };
};
in t.templates
