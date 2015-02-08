---
layout: post
title: "One Line Fix for Terminal.app"
categories: [linux, mac, terminal, screen]
published: true
---

Anybody that uses Terminal.app on Mac OS to regularly connect to Linux servers -- particularly those that use `screen` -- will be aware of the issues with backspace. The following terminal one liner seems to resolve the issues:

    $ defaults write com.apple.Terminal TermCapString xterm
