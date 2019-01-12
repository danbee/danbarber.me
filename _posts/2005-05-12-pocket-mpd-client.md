---
title: Pocket MPD Client
date: 2005-05-12 00:00:00 Z
categories:
- neompc
- geek
- web-stuff
layout: post
---

<a href="http://www.pixelhum.com/archives/2005-05-12/pocket-mpd-client/"><img class="centered" src="/images/mpd_client.png" /></a>

I've been looking around for a suitable way to control <a href="http://www.musicpd.org">MPD</a> from either my desktop PC or my PDA (with wireless adapter).  I couldn't find anything that really suited me; they were either too bloated with features, or too simplistic.  So... like a good little hacker, I started writing my own.

<em><strong>Update</strong>: <a href="http://www.pixelhum.com/archives/2005-05-29/neompc-02/">First release is available</a>.</em>

<em><strong>Update 2</strong>: NeoMPC now has it's <a title="NeoMPC" href="/neompc/">own page</a>.</em>

<!-- more -->

<a href="http://www.musicpd.org">MPD (Music Player Daemon)</a> is a great little app that runs in the background on your Linux box and plays music.  You control it with a client of some sort; currently available are GTK and QT based clients for the desktop, web based clients written in PHP, and command line based clients, one of which uses ncurses.  It supports many music file formats, as well as gapless playback (essential in my opinion) and crossfading.  It's also very lightweight and doesn't use much resources.

I'm using <a href="http://mpd.24oz.com/">MPD-Class</a> to actual control MPD, which means I don't have to get my PHP hands too dirty, and I'm using <a href="http://smarty.php.net/">Smarty</a> for the visual interface which, as an added bonus, means it should be easily skinnable.

Here's a couple of shots of the interface as it currently stands.

<a title="Photo Sharing" href="http://www.flickr.com/photos/danbee/13536019/"><img width="88" height="100" alt="The playlist interface" src="http://photos9.flickr.com/13536019_8f0a988d9c_t.jpg" /></a> <a title="Photo Sharing" href="http://www.flickr.com/photos/danbee/13536018/"><img width="88" height="100" alt="The control interface" src="http://photos11.flickr.com/13536018_6d67181f92_t.jpg" /></a>

The playlist screen works in as much as it does show the playlist, but the buttons aren't functioning yet.  The control screen pretty much works, although at the moment it reloads the page for every button press, which seems fine on the desktop, but Pocket Internet Explorer reloads all the images too (and not particularly quickly either), which looks rubbish.  I'm thinking about possibly an AJAX solution but it depends on how much JavaScript Pocket IE supports.

I'm tempted to start a project on SourceForge or something, but I need a good name first.  Any suggestions?
