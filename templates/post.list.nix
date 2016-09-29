{ conf, lib, ... }:
with lib;
post:
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
  ''
