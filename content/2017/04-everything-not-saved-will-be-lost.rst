#04 - Everything not saved will be lost
#######################################

:date: 2017-03-13
:description: Everything not saved will be lost. (Nintendo Quit Screen message)

Nix, NixOS and nixpkgs are all moving ahead at good speed. The `17.03 milestone`_ is more than 50% complete, and we merged 144 pull requests for nixpkgs just in the last seven days.

.. _`17.03 milestone`: https://github.com/NixOS/nixpkgs/milestone/10


News
====

- We now allow packages to be marked insecure, and you have to opt-in to install insecure packages similarly to how you opt in to non-free software.  The option is called ``permittedInsecurePackages``. See the `updated docs`_ for more.

- Robin finished the `systemd 232 update`_ which opens up several new `opportunities for hardening`_. It will also allow us to move away from hard-coded user IDs for less important services. Just use ``DynamicUser = true``.

- Thanks to Graham we now have `aarch64 support`_, and it's even being build Hydra! Many of you will have noticed already from the beatiful stream of emails for each succeeding and failing package.

.. _`updated docs`: https://github.com/NixOS/nixpkgs/pull/23130
.. _`systemd 232 update`: https://github.com/NixOS/nixpkgs/commit/a38f1911d34f2a72e15d5e98d76bece6cb8042a8
.. _`opportunities for hardening`: https://github.com/NixOS/nixpkgs/issues/20186
.. _`aarch64 support`: https://github.com/NixOS/nixpkgs/pull/23638


Reading
=======

TODO:

Presentations
=============

- Eric Sagnes gave an introductory NixOS talk in Japanese. The `slides are here`_.

.. _`slides are here`: https://github.com/Tokyo-NixOS/presentations

- Maksim Bronsky presented `Vulnix`_ at `Chemnitzer Linux-Tage`_.

.. _`Vulnix`: https://github.com/flyingcircusio/vulnix
.. _`Chemnitzer Linux-Tage`: https://chemnitzer.linux-tage.de/2017/en/programm/beitrag/314


Meetups
=======

- **Mar 12, 2017**, `London NixOS User Group`_ at `Smarkets`_, London, UK

  Smarkets kindly offered us a space for our second community hackday!

  There will be talking, pizzas and lots of packaging going on. Bring your own
  projects or just tag along and help other people out. Whether you have some
  software that you'd like to see packaged or questions about how everything
  fits together, there will be people available to help you.

.. _`London NixOS User Group`: https://www.meetup.com/NixOS-London/events/237738532/
.. _`Smarkets`: https://smarkets.com/about


- **Mar 22, 2017**, `Munich NixOS Meetup`_ at `OpenLab Augsburg`_, Augsburg,
  Germany

  John Darrington will give a talk about guix and guixSD, a package manager and
  a Linux distribution which are based on similar concepts as nix/NixOS.

  The talk will be in English.

- **Mar 24, 2017**, `Tokyo NixOS meetup`
  Japan

  My Japanese isn't good enough to figure out the speaker, but if you live in Japan
  you should go!

.. _`Munich NixOS Meetup`: https://www.meetup.com/Munich-NixOS-Meetup/events/237831744/?eventId=237831744
.. _`OpenLab Augsburg`: https://maps.google.com/maps?f=q&hl=en&q=48.357765,10.886834
.. _`Tokyo NixOS meetup`: https://www.meetup.com/ja-JP/Tokyo-NixOS-Meetup/events/238329705/

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


Questions
=========

- `In a new nixos derivation, based on a binary distribution, why am I getting an error referring to nativeBuildInputs?`_

.. _`In a new nixos derivation, based on a binary distribution, why am I getting an error referring to nativeBuildInputs?`: http://unix.stackexchange.com/questions/350997/in-a-new-nixos-derivation-based-on-a-binary-distribution-why-am-i-getting-an-e


Jobs
====

    `Looking for some Nix developers? Let us help you.`_

.. _`Looking for some Nix developers? Let us help you.`: https://github.com/NixOS/nixos-weekly/issues/new

TODO

- `Smarkets`_, London, United Kingdom

  We are looking for  `Infra team lead`_ and `Infra engineer`_.

  The jobs are not a Nix jobs per se since we are not using Nix at the moment.
  However, internally few of us are interested in trying it for e.g. building
  AMIs or provisioning docker containers with (mostly) python software. We think
  some strong candidate with experience of using Nix in production would have
  a good chance of seeing some adoption here.


.. _`Smarkets`: https://smarkets.com/about
.. _`Infra team lead`: https://boards.greenhouse.io/smarkets/jobs/486940
.. _`Infra engineer`: https://boards.greenhouse.io/smarkets/jobs/486940
.. _`All open positions`: https://smarkets.com/careers


Editor's corner
===============

TODO
