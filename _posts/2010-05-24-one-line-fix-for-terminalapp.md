---
title: One Line Fix for Terminal.app
date: Mon, 24 May 2010 00:00:00 +0000
categories:
- blog
- linux
- mac
- screen
- terminal
layout: post
---

Anybody that uses Terminal.app on Mac OS to regularly connect to Linux servers -- particularly those that use `screen` -- will be aware of the issues with backspace. The following terminal one liner seems to resolve the issues:

    $ defaults write com.apple.Terminal TermCapString xterm



