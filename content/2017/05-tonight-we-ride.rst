#05 - Tonight We Ride
#####################

:date: 2017-03-28
:description: Tonight We Ride - Said The King To The River from La Dispute

The `17.03 "Gorilla" release`_ has been tagged! There are too many good things in this release to pick favourites. I refer you to the `release notes`_ instead.

Some fun stats:

- ~ 900 new packages since 16.09
- ~ 80 new contributors (very inexact science this)
- ~ 60 new services

.. _`17.03 "Gorilla" release`: https://github.com/NixOS/nixpkgs/tree/17.03
.. _`release notes`: https://github.com/NixOS/nixpkgs/blob/master/nixos/doc/manual/release-notes/rl-1703.xml

News
====

- Did I mention the release? `Robin`_ has been doing a fantastic job, thank him when you meet him! He's also had a lot of help of course, so thanks to all those people as well. It's a pretty long list and you can get it with "``git shortlog 8def08..17.03``".
- We now have an `official RFC process`_. Thanks to zimbatm for writing our first ever RFC. We already have `three pull requests`_ so go forth and comment.
- Sander `released Disnix 0.7`_
- Théophane has started his work on typing Nix. You can `follow along here`_. He's also answering some questions in `this mailing list thread`_.

.. _`Robin`: https://github.com/globin
.. _`official RFC process`: https://github.com/NixOS/rfcs
.. _`released Disnix 0.7`: https://nixos.org/disnix
.. _`follow along here`: https://typing-nix.regnat.ovh/
.. _`this mailing list thread`: http://lists.science.uu.nl/pipermail/nix-dev/2017-March/023274.html
.. _`three pull requests`: https://github.com/NixOS/rfcs/pulls


Reading
=======

- One long-standing issue in Nix has been the storage of secrets. Right now `many of our services`_ store their secrets in ``/nix`` where they are world readable. This means you can't have root-only secrets, multi-user systems are problematic, and if one of your services is compromised it can be used to steal all your other secrets. Eelco created an RFC for `encrypting secrets at rest`_.

.. _`many of our services`: https://github.com/NixOS/nixpkgs/issues/24288
.. _`encrypting secrets at rest`:  https://github.com/NixOS/rfcs/pull/5/files


Editor's corner
===============

A substantial part of the effort of publishing the "weekly" news is collecting the news in the first place. If you see anything cool, want to share a job, meetup or presentation add a comment with your item at https://github.com/NixOS/nixos-weekly. It's super helpful!
