{ conf, ... }:
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
''
