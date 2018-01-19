Welcome
=======

Thank you for helping edit the NixOS "Weekly" Newsletter!

Creating a new post
===================


1. Copy `template.rst <./template.rst>`_ to ``content/<year>/<number>-<title>.rst``

2. Make changes

   Running ``nix-shell --command "pelican -r"`` will rebuild the issue
   whenever new content is discovered. Check the ``drafts`` folder for
   the output.

   Alternatively, ``nix-build`` will build and produce ``result``.

3. Create a pull-request against ``master``.

   You'll be able to view the staging site at http://weekly.nixos.org/preview.

4. Ask for contributions.

   Some good places to do so may include:

   - the mailing list
   - social media
   - friends/coworkers

   Historically, the pull-request has been where contributions have
   been made.

5. Publish by merging into ``production``.
