{ conf, templates, lib, ... }:
with lib;
page:
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
    }
