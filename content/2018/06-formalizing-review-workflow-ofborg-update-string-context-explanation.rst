#06 - Formalizing review workflow, OfBorg update, String Context explanation
############################################################################

:date: 2018-08-15
:description: If we knew what it was we were doing,
              it would not be called research, would it?


News
====

.. - Example news item title `with link`_
..
..   News item description (optional)
..
.. .. _`with link`: http://example.com

- `An EPYC NixOS build farm`_

  Graham explores and benchmarks an AMD EPYC build server
  against a differently incredible build server, finding
  the EPYC's builds are much faster across the board.

.. _`An EPYC NixOS build farm`: https://grahamc.com/blog/an-epyc-nixos-build-farm


- `Understanding Nix's String Context`_

  Shea Levy explains what is String Context, how it's implemented
  in Nix and shares implications on the use of the language.

.. _`Understanding Nix's String Context`: http://blog.shealevy.com/2018/08/05/understanding-nix's-string-context/


- `PostgreSQL packaging is getting an overhaul`_

  Easier use of plugins, version 10 as default, improved documentation,
  LLVM JIT support and more.

.. _`PostgreSQL packaging is getting an overhaul`: https://github.com/NixOS/nixpkgs/pull/38698

- `RFC: pkgs.overrideWithScope`_

  Add pkgs.overrideWithScope. This function is similar to pkgs.override, except
  that it filters the arguments like callPackage does.

.. _`RFC: pkgs.overrideWithScope`: https://github.com/NixOS/nixpkgs/pull/44196

- `RFC: Use meta.tests to link from packages to the tests that test them`_

  Aims to improve test discovery in nixpkgs.

.. _`RFC: Use meta.tests to link from packages to the tests that test them`: https://github.com/NixOS/nixpkgs/pull/44439

- `How to deploy Mendix applications with Nix/NixOS`_

.. _`How to deploy Mendix applications with Nix/NixOS`: http://sandervanderburg.blogspot.com/2018/08/automating-mendix-application.html


- `Layered build function abstractions for building Nix packages`_

  An elaborate blog post that composes the stdenv.mkDerivation {} abstraction
  function from scratch by using a layered approach.

.. _`Layered build function abstractions for building Nix packages`: http://sandervanderburg.blogspot.com/2018/07/layered-build-function-abstractions-for.html

- `OfBorg update`_

  Build time-outs, push-button deploys, monitoring transparency, and more.

.. _`OfBorg update`: https://www.patreon.com/posts/timeouts-nix-ci-20643198


- `RFC 30: Formalize review workflow`_

  A proposal for a new review workflow based on a set of pull-request states
  (needs:review, needs:work). It is intended to help reviewers and contributors
  get PRs merged quicker and reduce likelihood of PRs getting lost. It also
  greatly increases the value of non-commiter reviews.

.. _`RFC 30: Formalize review workflow`: https://github.com/NixOS/rfcs/pull/30


- `libnix-haskell 0.2.0.1 released`_

  libnix provides a nicely typed wrapper around the nix command line (for parsing,
  instantiating and realizing). It also provides wrappers for the nix-prefetch-url
  and nix-prefetch-git.

.. _`libnix-haskell 0.2.0.1 released`: https://hackage.haskell.org/package/libnix-0.2.0.1


Contribute to NixOS Weekly Newsletter
=====================================

This work would not be possible without the many contributions of the community.

You can help too! Comment on the `pull request`_ for the next edition
or look at the `issue tracker`_ to add other improvements.

.. _`pull request`: https://github.com/NixOS/nixos-weekly/pulls
.. _`issue tracker`: https://github.com/NixOS/nixos-weekly/issues
