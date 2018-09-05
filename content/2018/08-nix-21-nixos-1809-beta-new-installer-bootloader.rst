#08 - Nix 2.1, NixOS 18.09 beta, new installer bootloader
#########################################################

:date: 2018-09-05
:description: The free sharing and teaching of open source is incompatible with the notion of the solitary genius.



News
====

.. - Example news item title `with link`_
..
..   News item description
..
.. .. _`with link`: http://example.com


- `Nix overlay to program and use a tomu U2F token`_

.. _`Nix overlay to program and use a tomu U2F token`: https://github.com/teh/tomu-u2f-overlay

- `#33686: New installer bootloader`_

  Updates the bootloader,
  shedding one of the few remaining old logos, while also adding
  new features. Mainly, HiDPI options under a new sub-menu,
  allowing modesetting the console to a readable size!

.. _`#33686: New installer bootloader`: https://github.com/NixOS/nixpkgs/pull/33686


- `RFC 32: Tweak the process of executing phases in the stdenv for better nix-shell UX`_

  A proposal for making it easier to manually run phases of a build inside a nix-shell.

.. _`RFC 32: Tweak the process of executing phases in the stdenv for better nix-shell UX`: https://github.com/NixOS/rfcs/pull/32

- `Real-time audio in NixOS`_

.. _`Real-time audio in NixOS`: https://github.com/musnix/musnix


- `Bootstrap a zfs-on-root NixOS installation using only one command with Themelios`_

  Themelios automates the entire installation process of a NixOS zfs-on-root system
  using any NixOS livedisk with an internet connection and your git repository.
  Themelios is flexible with many configuration options and allows for unique,
  per-machine customization.

.. _`Bootstrap a zfs-on-root NixOS installation using only one command with Themelios`: https://github.com/a-schaefers/themelios


- `Nix 2.1 released`_

  Installer defaulting to single user, multi user support for Linux,
  constant memory streaming of NAR files and more.

.. _`Nix 2.1 released`: https://discourse.nixos.org/t/nix-2-1-released/875


- `Zero Hydra Failures for 18.09`_

  Excellent opportunity to join the community get build failures down to zero.

.. _`Zero Hydra Failures for 18.09`: https://github.com/NixOS/nixpkgs/issues/45960


- `19.03 to be called Koi`_

.. _`19.03 to be called Koi`: https://github.com/NixOS/nixpkgs/commit/e144899b7492d8fdc48c685516347ba7788245a5#diff-09da2f18ff6731224a67af7f0081d111R6


- `Recent Cachix downtime`_

  A dive into what went wrong in recent ~2h downtime and steps taken to prevent it
  from happening again.

.. _`Recent Cachix downtime`: https://domenkozar.com/2018/09/04/recent-cachix-downtime/


Contribute to NixOS Weekly Newsletter
=====================================

This work would not be possible without the many contributions of the community.

You can help too! Create or comment on the `pull request`_ for the next edition
or look at the `issue tracker`_ to add other improvements.

.. _`pull request`: https://github.com/NixOS/nixos-weekly/pulls
.. _`issue tracker`: https://github.com/NixOS/nixos-weekly/issues
