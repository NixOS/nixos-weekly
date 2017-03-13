#04 - Everything not saved will be lost
#######################################

:date: 2017-03-13
:description: Everything not saved will be lost. (Nintendo Quit Screen message)

Nix, NixOS and nixpkgs are all moving ahead at good speed. The `17.03
milestone`_ is more than 50% complete, and we merged 144 pull requests for
nixpkgs just in the last seven days.

.. _`17.03 milestone`: https://github.com/NixOS/nixpkgs/milestone/10


News
====

- The `NixOS 17.03 beta
  <http://lists.science.uu.nl/pipermail/nix-dev/2017-March/022979.html>`__ has
  been announced.

- We now allow packages to be marked insecure, and you have to opt-in to install
  insecure packages similarly to how you opt in to non-free software. The option
  is called ``permittedInsecurePackages``. See the `updated docs`_ for more.

- Robin finished the `systemd 232 update`_ which opens up several new
  `opportunities for hardening`_. It will also allow us to move away from
  hard-coded user IDs for less important services. Just use ``DynamicUser =
  true``.

- Thanks to Graham we now have `aarch64 support`_, and it's even being built by
  Hydra! Many of you will have noticed already from the beautiful stream of
  emails for each succeeding and failing package.

- Progress on the `proposal for RFC <https://github.com/zimbatm/rfcs/pull/1>`__
  which started from a FOSDEM discussion.

- `Move NodeJS to separate overlay repository?
  <http://lists.science.uu.nl/pipermail/nix-dev/2017-March/023043.html>`__
  (discussion)

.. _`updated docs`: https://github.com/NixOS/nixpkgs/pull/23130
.. _`systemd 232 update`: https://github.com/NixOS/nixpkgs/commit/a38f1911d34f2a72e15d5e98d76bece6cb8042a8
.. _`opportunities for hardening`: https://github.com/NixOS/nixpkgs/issues/20186
.. _`aarch64 support`: https://github.com/NixOS/nixpkgs/pull/23638

Reading
=======

- `From Vagrant to NixOps
  <https://blog.mayflower.de/5976-From-Vagrant-to-Nixops.html>`_
  by `Hendrik Schaeidt <https://twitter.com/hschaeidt>`_

  A walkthrough to configure a symfony2 project with nginx, mysql, and php-fpm
  from scratch.


Presentations
=============

- `Eric Sagnes <https://github.com/ericsagnes>`_ gave an introductory NixOS talk
  in Japanese. The `slides are here`_.

- `Maksim Bronsky <https://twitter.com/lenkodonchev>`_ presented `Vulnix`_ at
  `Chemnitzer Linux-Tage`_. The `slides
  <https://github.com/flyingcircusio/vulnix/raw/master/doc/2017-03-11-Vulnix.pdf>`__
  (PDF download, DE only) are in the repository.

- `Lenko Donchev <https://twitter.com/lenkodonchev>`_ gave a lightning talk
  "NixOS the purely functional Linux distribution". The `slides
  <https://speakerdeck.com/lenkodonchev/nixos-the-purely-functional-linux-distribution>`__
  are available online.

- John Wiegley gave a presentation "How I use nix for Haskell development" at
  the Bay Area Nix/NixOS User Group. `Video <https://youtu.be/G9yiJ7d5LeI>`__
  available.


.. _`slides are here`: https://github.com/Tokyo-NixOS/presentations
.. _`Vulnix`: https://github.com/flyingcircusio/vulnix
.. _`Chemnitzer Linux-Tage`: https://chemnitzer.linux-tage.de/2017/en/programm/beitrag/314


Meetups
=======

- **Mar 24, 2017**, `Tokyo NixOS Meetup`_, Tokyo, Japan

  My Japanese isn't good enough to figure out the speaker, but if you live in Japan
  you should go!

- **Mar 29, 2017**, `Munich NixOS Meetup`_ at `OpenLab Augsburg`_, Augsburg,
  Germany

  John Darrington will give a talk about guix and guixSD, a package manager and
  a Linux distribution which are based on similar concepts as nix/NixOS.

  The talk will be in English.

.. _`Munich NixOS Meetup`: https://www.meetup.com/Munich-NixOS-Meetup/events/237831744/?eventId=237831744
.. _`OpenLab Augsburg`: https://maps.google.com/maps?f=q&hl=en&q=48.357765,10.886834
.. _`Tokyo NixOS Meetup`: https://www.meetup.com/ja-JP/Tokyo-NixOS-Meetup/events/238329705/

Meetups that just happened
--------------------------

- **Feb 24–26, 2017**, `HackIllinois`_, University of Illinois, USA

  For any university students in the US, the University of Illinois at
  Urbana-Champaign is holding a hackathon oriented towards getting people into
  open source development, and I'm going to be mentoring people for
  Nix/NixOS/Haskell development. Be sure to put "NixOS" or "Haskell" into your
  application somewhere.

.. _`HackIllinois`: https://medium.com/@HackIllinois/open-source-2017-b322ad688471#.vim3uki6h

- **Feb 25, 2017**, `Amsterdam Nix Meetup`_ at `Container Solutions`_,
  Amsterdam, Netherlands

.. _`Amsterdam Nix Meetup`: https://www.meetup.com/Amsterdam-Nix-Meetup/events/232753333/
.. _`Container Solutions`: https://maps.google.com/maps?f=q&hl=en&q=de+Ruyterkade+142-143%2C+Amsterdam%2C+nl

- **Mar 02, 2017**, `Bay Area Nix/NixOS User Group`_ at Takt, San Francisco, USA

  See the presentation about using Nix for Haskell development above.

.. _`Bay Area Nix/NixOS User Group`:
   https://www.meetup.com/Bay-Area-Nix-NixOS-User-Group/events/237430925/

- **Mar 12, 2017**, `London NixOS User Group`_ at `Smarkets`_, London, UK

  Smarkets kindly offered us a space for our second community hackday!

  There will be talking, pizzas and lots of packaging going on. Bring your own
  projects or just tag along and help other people out. Whether you have some
  software that you'd like to see packaged or questions about how everything
  fits together, there will be people available to help you.

.. _`London NixOS User Group`: https://www.meetup.com/NixOS-London/events/237738532/
.. _`Smarkets`: https://smarkets.com/about


Questions
=========

- `In a new nixos derivation, based on a binary distribution, why am I getting an error referring to nativeBuildInputs?`_

- `NixOS container networking
  <http://lists.science.uu.nl/pipermail/nix-dev/2017-March/023056.html>`__.

- `LXC containers on NixOS
  <http://lists.science.uu.nl/pipermail/nix-dev/2017-March/023008.html>`__.

- `Virtualization on NixOS
  <https://www.reddit.com/r/NixOS/comments/5xoewu/virtualization_on_nixos/>`__

.. _`In a new nixos derivation, based on a binary distribution, why am I getting an error referring to nativeBuildInputs?`: http://unix.stackexchange.com/questions/350997/in-a-new-nixos-derivation-based-on-a-binary-distribution-why-am-i-getting-an-e


Jobs
====

    `Looking for some Nix developers? Let us help you.`_

.. _`Looking for some Nix developers? Let us help you.`: https://github.com/NixOS/nixos-weekly/issues/new

- The Blue Brain Project recruit and is looking for someone with packaging,
  NixOS / Nix packaging knowledges and with a software engineering background.
  If any of you might be interested : http://emploi.epfl.ch/page-142376-en.html,
  The job is in Switzerland, Geneva, Swiss salary and Work visa granted for EU
  citizen if recruited.


Editor's corner
===============

TODO
