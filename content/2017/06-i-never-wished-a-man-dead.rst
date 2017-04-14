#06 - I never wished a man dead
###############################

:date: 2017-04-14
:description: I've never wished a man dead, but I have read some obituaries
              with great pleasure. - Mark Twain (maybe)

Or in other words: no more Perl in Nix! Shea Levy's last branch for his
long-ongoing work to remove Perl from the Nix tool has `finally been merged`_

.. _`finally been merged`: https://github.com/NixOS/nix/pull/1027

News
====

- NixOS on `Packet.net`_
  
  Over the past several months, **Graham Christensen** (grahamc), **Tuomas
  Tynkkynen** (dezgeg), and many wonderful people from `Packet.net`_ have
  collaborated on bringing NixOS to Packet.net.

  Our collaboratioon started in January with **Packet sponsoring many Hydra
  build servers**. It continued by bringing ARMv8 builders to hydra.nixos.org.
  It is continued again today by launching first-class support for NixOS
  on the Packet.net platform, directly from their panel.

      ...launching first-class support for NixOS...

  This allows any user to quickly provision four
  different types of powerful, bare metal x86-64 servers in minutes.
  
      Sign up now at https://www.packet.net/promo/nixos/
      
      
  or use the promo code "nixos" **for $25 in credit**.
  
- NixOS Security Advisory: `Docker Local Privilege Escalation`_

  This is a fun one because it is the first CVE taken against NixOS.
  A milestone!

  At this point we also must thank @grahamc and the security team for their
  heroic efforts. Their work makes NixOS a more reliable solution.

  To help them please head to `Vulnerability Roundup 26`_.

- New `node2nix`_ (v1.2.0) released.

- `Takt has open-sourced a tool`_ to deploy their services from hydra.

- New `pypi2nix`_ (v1.8.0) release.


.. _`Docker Local Privilege Escalation`: http://lists.science.uu.nl/pipermail/nix-dev/2017-April/023329.html
.. _`Vulnerability Roundup 26`: https://github.com/NixOS/nixpkgs/issues/24161
.. _`node2nix`: https://www.npmjs.com/package/node2nix
.. _`Takt has open-sourced a tool`: https://code.takt.com/announcing-hail-4da7208df56d
.. _`pypi2nix`: https://github.com/garbas/pypi2nix/releases/tag/v1.8.0
.. _`Packet.net`: https://packet.net


Reading
=======

- `One Magic Line of Code that fixes Nix syntax highlighting in Vim`_

- `NixOS Spring-Summer Collection 17`_ / `NixOS, collection printemps-été 17`_

- `Using Nix to manage multiple Ruby versions`_

- `With alternative package management: Linux distribution NixOS 17.03 published`_ / `Mit alternativer Paketverwaltung: Linux-Distribution NixOS 17.03 erschienen`_

- `Using NixOS (As Your Main Desktop OS`_

- `Using Nix (NixOS) as a build system for Rust, and caching binary crates`_

- `NixOS troubleshooting with git bisect`_

.. _`One Magic Line of Code that fixes Nix syntax highlighting in Vim`: http://nicknovitski.com/vim-nix-syntax
.. _`NixOS Spring-Summer Collection 17`: https://translate.google.com/translate?sl=auto&tl=en&js=y&prev=_t&hl=en&ie=UTF-8&u=http%3A%2F%2Flinuxfr.org%2Fnews%2Fnixos-collection-printemps-ete-17&edit-text=
.. _`NixOS, collection printemps-été 17`: http://linuxfr.org/news/nixos-collection-printemps-ete-17
.. _`Using Nix to manage multiple Ruby versions`: https://labs.uswitch.com/using-nix-to-manage-multiple-ruby-versions/
.. _`With alternative package management\: Linux distribution NixOS 17.03 published`: https://translate.google.com/translate?hl=en&sl=auto&tl=en&u=https%3A%2F%2Fwww.heise.de%2Fix%2Fmeldung%2FMit-alternativer-Paketverwaltung-Linux-Distribution-NixOS-17-03-erschienen-3672948.html
.. _`Mit alternativer Paketverwaltung\: Linux-Distribution NixOS 17.03 erschienen`: https://www.heise.de/ix/meldung/Mit-alternativer-Paketverwaltung-Linux-Distribution-NixOS-17-03-erschienen-3672948.html
.. _`Using NixOS (As Your Main Desktop OS`: http://www.calebgossler.com/posts/using-nixos.html
.. _`Using Nix (NixOS) as a build system for Rust, and caching binary crates`: https://www.reddit.com/r/rust/comments/649h6m/using_nix_nixos_as_a_build_system_for_rust_and/
.. _`NixOS troubleshooting with git bisect`: https://github.com/lukego/blog/issues/17


Events / Meetups
================

- **Apr 22, 2017**, `Augsburger Linux-Infotag`_, Augsburg, Germany

  The Augsburger Linux Infotag is a one-day conference with about 20 lectures
  and 9 workshops on Linux, open source software and the digital society.
  Admission is free. We are representing NixOS with a booth at the conference.

.. _`Augsburger Linux-Infotag`: https://www.meetup.com/Munich-NixOS-Meetup/events/239077440/

- **May 27, 2017**, `Reproducible development environments with Nix: Johannes Bornhold`_, Munich, Germany

  Providing build and development environments for Python based projects is
  typically not without challenges. This talk presents how Nix - The Purely
  Functional Package Manager can be used to provide reproducible environments
  for development and deployment of Python based Web projects.

.. _`Reproducible development environments with Nix: Johannes Bornhold`: https://pyconweb.com/talks/27-05-2017/reproducible-development-environments-with-nix

- **May 01, 2017**, `Munich NixOS Meetup - Hackathon & Barbecue`_, Augsburg, Germany

  Bring the Nix project you are currently working on or struggling with and
  discuss it with other people. Followed by a barbecue in the evening.

.. _`Munich NixOS Meetup - Hackathon & Barbecue`: https://www.meetup.com/Munich-NixOS-Meetup/events/239077247/?eventId=239077247


Editor's corner
===============

As you can see last weeks were quite busy for NixOS community. What does that
mean in numbers for last month?

.. image:: images/06-montly-activity.png
    :alt: Monthly activity in NixOS/nixpkgs

Source: https://github.com/NixOS/nixpkgs/pulse/monthly

Help us shape `next issue`_ of NixOS weekly newslettter.

.. _`next issue`: https://github.com/NixOS/nixos-weekly/issues
