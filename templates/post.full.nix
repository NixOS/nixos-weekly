{ lib, templates, ... }:
with lib;
post:
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
    }
