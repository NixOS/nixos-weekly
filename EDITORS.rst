Welcome
=======

Thank you for helping edit the NixOS "Weekly" Newsletter!


Requirements
============

You'll need the following in order to work through the pipeline:

- Git.
- Nix.
- Push permissions to `master` and `production` branches of this
  repository.

  Please ask if you don't have this already. You can create a ticket
  on GitHub or ping `#nixos` on IRC.

- Mailchimp account to send the newsletter.


Responsibilities
================

Core responsibilities are to:

#. Decide on a publish date.
#. Initiate and format the next edition of the newsletter.
#. Send out a call for contributions.
#. Field the suggestions and incorporate them
#. Optionally add a brief intro and outro.
#. Have fun!


Some Notes
==========

- Contributor status

  Ideally you should be able to push to the `master` and `production`
  branches of this repository.

- `master` branch is for development

  Travis is setup to publish changes on master to http://weekly.nixos.org/preview



Creating a new post
===================

#. Copy `template.rst <./template.rst>`_ to ``content/<year>/<number>-<title>.rst``

#. Create a pull request from `master` to `production`.

   Changes will be visible at http://weekly.nixos.org/preview

#. Make changes

   You can preview the site locally while editing by running:

   ::

      nix-shell --command "python run.py

   This will serve on `http://127.0.0.1:5500 <http://127.0.0.1:5500>`_ and automatically
   refresh on changes.

4. Ask for contributions.

   You can send an email to `nix-devel@googlegroups.com <mailto:nix-devel@googlegroups.com>`_.
   There's a template in `./CfC.rst <./CfC.rst>`_.

   Historically, the pull-request has been where contributions have
   been made.

5. Publish by merging into ``production``.

6. Send the email. FIXME: not sure how yet, more to come


Troubleshooting
===============

Ideally everything will just work, but in the rare cases of trouble,
here is a runbook.

- Merging to `production` fails CI FIXME: get more info, link to ticket

  There's a bug in `.travis.yml` causing merges to `production` to
  fail.


Please do create a ticket when something breaks, we want this to be as
straightforward as possible.
