{ conf, state, lib, templates,  ... }:
with lib;
posts:
  ''
    <feed xmlns="http://www.w3.org/2005/Atom"
          xmlns:planet="http://namespace.uri/"
          xmlns:indexing="urn:atom-extension:indexing"
          indexing:index="no">

      <access:restriction xmlns:access="http://www.bloglines.com/about/specs/fac-1.0" relationship="deny"/>

      <title>NixOS Weekly</title>
      <updated>${state.current_timestamp}</updated>
      <generator uri="${conf.siteUrl}">NixOS Weekly</generator>
      <author>
        <name>NixOS Weekly Team</name>
        <email>weekly@nixos.org</email>
      </author>
      <id>${conf.siteUrl}/atom.xml</id>
      <link href="${conf.siteUrl}/atom.xml" rel="self" type="application/atom+xml"/>
      <link href="${conf.siteUrl}" rel="alternate"/>
      
      ${concatMapStringsSep "\n" templates.post.atomList posts}

    </feed>
  ''
