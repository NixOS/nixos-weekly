{ templates, conf, lib, ... }:
with lib;
page:
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
  }
