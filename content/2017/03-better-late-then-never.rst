#03 - Better Late Than Never
############################

:date: 2017-02-22
:description: Better late than never (me), but never late is better (my wife).

Another two weeks have passed and it is time for our summary.

A new section **Questions** was added to the newsletter. Intention for this new
section is that it is going to expose some of the questions that happen in the
past. With this we hope that none of the questions will be left unanswered.

Sometimes we forget just how awesome Nix / NixOS is and we take its
capabilities for granted. It is important that we remind ourself from time to
time why are we using it, via reddit - `In Love`_:

    Just thought I'd share a compliment, switched from Arch, this thing is
    beautiful. Installing low level packages, configuration files, it all works
    so well.

    Only issues are documentation (which I can see is being worked on and
    solved, albeit with limited manpower), and that some packages don't seem to
    work well with the package manager, but that's fixable over time.

    But it's great for what it is, easy to get running, but still fully
    customization.


.. _`In Love`: https://www.reddit.com/r/NixOS/comments/5uc9ms/in_love/


News
====

- Important date: **27. Feb 2017** a branch-off for next NixOS release, 17.03
  (Gorilla), `is going to happen`_

  This means you have few more days to land your change to `nixpkgs`_ master if
  you want them to be a part of Gorilla.

  You can also follow the `17.03`_ milestone.

.. _`is going to happen`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31817.html
.. _`nixpkgs`: https://github.com/NixOS/nixpkgs
.. _`17.03`: https://github.com/NixOS/nixpkgs/milestone/10

- Assistance Required for Vulnerability Roundups 

  Since last newletter 2 Vulnerability Roundup happen: 21_, 22_.

  `Graham Christensen`_ is doing an amazing work coordinating the effort of
  security team and also doing big chunk of the work. Recently `he asked for
  help`_ and let us make sure he gets some helping hand, or two, three, ...

  We can all recognize that The work the security team is doing is of great
  importance, since that makes it possible for the rest community to use NixOS
  in more production environments.

.. _`Graham Christensen`: https://github.com/grahamc
.. _21: https://github.com/NixOS/nixpkgs/issues/22549
.. _22: https://github.com/NixOS/nixpkgs/issues/22826
.. _`he asked for help`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31432.html

- At FOSDEM a very `spontaneous NixOS discussion panel happen`. As a follow up
  `@zimbatm`_ created an `initial proposal for RFC`_.

  Having a more formal proposal how we work together and how bigger changes are
  discussed is a step towards mature Linux distribution. Having NixOS already
  reached this state is an impressive achievement.

.. _`@zimbatm`: https://twitter.com/zimbatm
.. _`spontaneous NixOS discussion panel happen`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31367.html
.. _`initial proposal for RFC`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31769.html

- `xorg-server major update`_

.. _`xorg-server major update`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31762.html

- `KDE4 removed in master`_

.. _`KDE4 removed in master`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31701.html

- `Haskell: master has switched to LTS 8.x with GHC 8.0.2`_

.. _`Haskell: master has switched to LTS 8.x with GHC 8.0.2`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31818.html

- `Python 3 as default (discussion)`_.

.. _`Python 3 as default (discussion)`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31806.html

- `Nixpkgs: Adding setcap-wrapper functionality`_

.. _`Nixpkgs: Adding setcap-wrapper functionality`: https://github.com/NixOS/nixpkgs/pull/16654

- `Nix: Add support for s3:// URIs`_

.. _`Nix: Add support for s3:// URIs`: https://github.com/NixOS/nix/commit/9ff9c3f2f80ba4108e9c945bbfda2c64735f987b

- Feedback requested: `Feedback on workshop material`_

.. _`Feedback on workshop material`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg32011.html

- Feedback requested: `Better firewalling in NixOS`_

.. _`Better firewalling in NixOS`: https://github.com/NixOS/nixpkgs/pull/12940

- Feedback requested: `"Monitoring" NixOS?`_
    
.. _`"Monitoring" NixOS?`:  https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31836.html


- Release: `vagrant-nixos-plugin`_ released v0.2.1, now with --show-trace
  support.

  Add basic nix configuration provisioning for NixOS guests in Vagrant.

.. _`vagrant-nixos-plugin`: https://rubygems.org/gems/vagrant-nixos-plugin/versions/0.2.1

- Release: `docker-nix-builder`_ beta.

  Did you ever have to battle with a user that only wants to have Docker
  installed on his system? Or a user that is developing on macOS and has broken
  nix packages?


  ``docker-nix-builder`` is a tool to help smooth the transition. Instead of
  using nix to build the project, use Docker to run nix to build the project.
  At the end the users gets a new Docker container that only (mostly) contains
  the build result.

- Release: Bundle Nix derivations to run anywhere, `nix-bundle`_

  ``nix-bundle`` is a way to package Nix attributes into single-file
  executables. Benefits: Single-file output, Can be run by non-root users, No
  runtime, Distro agnostic, Completely portable, No installation


.. _`nix-bundle`: https://github.com/matthewbauer/nix-bundle
.. _`docker-nix-builder`: https://github.com/numtide/docker-nix-builder


Reading
=======

- `A truly reproducible scientific paper?`_ by `Bruno Vieira`_.

.. _`A truly reproducible scientific paper?`: https://medium.com/@bmpvieira/a-truly-reproducible-scientific-paper-5059b282ee9a#.hutdj7dte
.. _`Bruno Vieira`: https://twitter.com/bmpvieira

- `NixOS Linux vs CoreOS Container Linux`_ by `Daniel van Dorp`_.

.. _`NixOS Linux vs CoreOS Container Linux`: https://www.vandorp.biz/2017/02/nixos-linux-vs-coreos-container-linux/
.. _`Daniel van Dorp`: https://twitter.com/djvdorp


Presentations
=============

- Last month's talk on `Nix and NixOS from the Louisville Haskell Meetup`_.

.. _`Nix and NixOS from the Louisville Haskell Meetup`:  https://youtu.be/D5Gq2wkRXpU

- `Deploying NPM packages with the Nix package manager`_ by `Sander van der Burg`_.

.. _`Deploying NPM packages with the Nix package manager`: https://video.fosdem.org/2017/K.4.601/deploying_npm_packages_with_nix.mp4
.. _`Sander van der Burg`: https://twitter.com/svdburg

- `NixOS - Les infrastructures immuables et la configuration déclarative`_ by David Sferruzza 

.. _`NixOS - Les infrastructures immuables et la configuration déclarative`: https://www.youtube.com/watch?v=YWSeJQKWw9g


Meetups
=======



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

- **Mar 22, 2017**, `Munich NixOS Meetup`_ at `OpenLab Augsburg`_, Augsburg,
  Germany

  John Darrington will give a talk about guix and guixSD, a package manager and
  a Linux distribution which are based on similar concepts as nix/NixOS.

  The talk will be in English.

.. _`Munich NixOS Meetup`: https://www.meetup.com/Munich-NixOS-Meetup/events/237831744/?eventId=237831744
.. _`OpenLab Augsburg`: https://maps.google.com/maps?f=q&hl=en&q=48.357765,10.886834


Meetups that just happened
--------------------------

- **Feb 18, 2017**, `Berlin NixOS Meetup`_ at `Schnee von morgen`_, Berlin,
  Germany

.. _`Berlin NixOS Meetup`: https://www.meetup.com/Berlin-NixOS-Meetup/events/237045577/
.. _`Schnee von morgen`: https://maps.google.com/maps?f=q&hl=en&q=Kiefholzstrasse+1%2C+12435+Berlin%2C+Berlin%2C+de

- **Feb 09, 2017**, `NixOS: Functional Packaging For The Win`_ by
  `Tobias Pflug`_ at `Wasserturm Stromeyersdorf`_, Konstanz, Germany

.. _`NixOS: Functional Packaging For The Win`: https://www.meetup.com/SeeIT-IT-Meetup-in-Konstanz-Kreuzlingen/events/236693855
.. _`Tobias Pflug`: http://twitter.com/tpflug
.. _`Wasserturm Stromeyersdorf`: https://maps.google.com/maps?f=q&hl=en&q=Turmstra%C3%9Fe+30%2C+78467+Konstanz%2C+%2C+Konstanz%2C+de


Questions
=========

- `Problem: fail to build ghc in nix`_

.. _`Problem: fail to build ghc in nix`: https://www.reddit.com/r/NixOS/comments/5ubtc4/fail_to_build_ghc_in_nix_missing_dependencies/

- `Best way to handle .desktop files in user installed packages`_

.. _`Best way to handle .desktop files in user installed packages`: https://www.reddit.com/r/NixOS/comments/5un4bi/best_way_to_handle_desktop_files_in_user/

- `Awesomewm and NixOS`_

.. _`Awesomewm and NixOS`: https://www.reddit.com/r/NixOS/comments/5ssgek/awesomewm/

- `Help - Global Cursor Config XMonad`_

.. _`Help - Global Cursor Config XMonad`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31518.html

- `Help with patch for screen locking`_

.. _`Help with patch for screen locking`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31433.html

- `How to nix-build again a built store path?`_

.. _`How to nix-build again a built store path?`: http://stackoverflow.com/questions/41486747/how-to-nix-build-again-a-built-store-path
 
- `NixOs, Haskell, opengl : problems with building and running openGL programs`_

.. _`NixOs, Haskell, opengl : problems with building and running openGL programs`: http://stackoverflow.com/questions/41527061/nixos-haskell-opengl-problems-with-building-and-running-opengl-programs

- `lib.mapAttrsToList and infinite recursion`_

.. _`lib.mapAttrsToList and infinite recursion`: http://stackoverflow.com/questions/42150082/lib-mapattrstolist-and-infinite-recursion

- `How to use buildMaven`_

.. _`How to use buildMaven`: https://www.mail-archive.com/nix-dev@lists.science.uu.nl/msg31613.html


Jobs
====

    `Looking for some Nix developers? Let us help you.`_

.. _`Looking for some Nix developers? Let us help you.`: https://github.com/NixOS/nixos-weekly/issues/new

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

As you also probably noticed, this newsletter is coming out 2 days late. I am
trying to get it out in time, but life happens also. If you would like to help
release weekly newletter please `contact me`_.

.. _`contact me`: https://twitter.com/garbas
