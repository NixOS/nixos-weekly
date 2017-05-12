#08 - Not all those who wander are lost
############################################

:date: TODO
:description: Not all those who wander are lost - J.R.R. Tolkien


TODO: introduction


News
====

- `NixCon 2017`_ is coming October 28-31 in Munich.

  Call for participation is open until July 31.

- The `Wiki <https://nixos.org/nixos/wiki.html>`_ is dead. Long live
  the `Wikis <https://github.com/nixos-users/wiki/wiki>`_!


  `This <https://github.com/NixOS/nixos-org-configurations/pull/30>`_
  is the change that disable the wiki.

  The old wiki has been for a while now with `ongoing work
  <https://github.com/NixOS/nixpkgs/milestone/8>`_ on updating and
  migrating the content.

  Current options are the `Community Cookbook
  <https://nix-cookbook.readthedocs.io/en/latest/index.html>`_ and the
  `nixos-users Wiki <https://github.com/nixos-users/wiki/wiki>`_. The
  latter is editable by anyone with a GitHub account.


- Nix has a thankful community.

  Profpatsch did some quick analysis of IRC messages.
  Summary:

  - `1.9% contain the word "thank" <https://twitter.com/Profpatsch/status/862303014601846784>`_
  - `2.4% last year <https://twitter.com/grhmc/status/862304182002479105>`_

- `IOHK is hiring <https://iohk.io/careers/#fk06gld>`_!


.. _`NixCon 2017`: http://nixcon2017.org/


Reading
========

- `Intro to Nix Channels and Reproducible NixOS Environment <http://matrix.ai/2017/03/13/intro-to-nix-channels-and-reproducible-nixos-environment/>`_

  The approach here may be supplemented by the `Cookbook
  <http://nix-cookbook.readthedocs.io/en/latest/faq.html#how-to-pin-nixpkgs-to-a-specific-commit-branch>`_.

- `Use NixOS for macOS TimeMachine backups <http://grahamc.com/blog/timemachine-backups-linux-nixos>`_.

- `Building Maven Packages with Nix <https://ww.telent.net/2017/5/10/building_maven_packages_with_nix>`_

  See also the `mvn2nix mailing list discussion <https://mailman.science.uu.nl/pipermail/nix-dev/2017-May/023677.html>`_.


Tooling
=======

- `pnix-shell.sh <https://gist.github.com/aherrmann/51b56283f9ed5853747908fbab907316>`_

  Creates gc-roots for all dependencies of a shell.nix

  `pnix-shell.sh discussion <http://lists.science.uu.nl/pipermail/nix-dev/2016-November/022173.html>`_

- `nix-package-search <https://www.reddit.com/r/NixOS/comments/5yxt45/simple_nix_package_search/>`_

  Small script that creates a cache of ``nix-env -qa --json`` use that
  for faster search. `@olejorgenb <https://github.com/olejorgenb>`_
  created a `this gist
  <https://gist.github.com/olejorgenb/0c3bafa3c7b63d1a2f83ee13582de7b9>`_
  with modifications to increase cache invalidation time, add
  free-memory check, and only search <nixpkgs>.

- `Zsh completion for nix-* tools <https://github.com/spwhitt/nix-zsh-completions>`_

  In addition to options, attribute paths are completed too

  - ``nix-env -iA``
  - ``nix-env -i --file local.nix -A``
  - ``nix-shell '<nixpkgs>' -A``
  - ``nix-shell -p``
  - ``nix-shell '<ni>'``
  - ``nix-env -e``


- `Auto install/run
  <https://mailman.science.uu.nl/pipermail/nix-dev/2017-May/023569.html>`_
  missing programs.





Events / Meetups
==================

- `NixOps Meetup <https://www.meetup.com/Munich-NixOS-Meetup/events/239835348/>`_ May 26, Munich

  Topics: the NixOps container backend. Possible hackathon afterwards.




Editor's corner
===============

