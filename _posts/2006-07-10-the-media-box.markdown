---
layout: post
title: "The Media Box"
categories: [news, neompc]
published: true
---

I've been trying unsuccessfully to get Apache installed on my media box, in order to continue development of NeoMPC.  I'd been getting an error message telling me that the build environment had changed, and all attempts at getting it compiled were failing.

Tonight I found the problem, in /etc/make.conf:

    CFLAGS="-O2 -march=i686  -msse -mmmx -mfpmath=sse  -pipe -fomit-frame-pointer"

You probably can't tell what's wrong with that line, even if you're a seasoned Gentoo Linux user.  Here is the correct line:

    CFLAGS="-O2 -march=i686 -msse -mmmx -mfpmath=sse -pipe -fomit-frame-pointer"

Spot the difference?  Look carefully...

<!-- more -->

There's *two* spaces between `-march=i686` and `-msse`, and again between `-mfpmath=sse` and `-pipe` and these cause the compile process to think that the build environment has changed somewhere down the line.  Stupid bloody CFLAGS parser.

For the record, here is the error that I was getting:

    configure: error: `CFLAGS' has changed since the previous run:
    configure:   former value:  -O2 -march=i686  -msse -mmmx -mfpmath=sse  -pipe -fomit-frame-pointer
    configure:   current value: -O2 -march=i686 -msse -mmmx -mfpmath=sse -pipe -fomit-frame-pointer
    configure: error: changes in the environment can compromise the build
    configure: error: run `make distclean' and/or `rm /var/tmp/portage/apache-2.0.58-r1/work/httpd-2.0.58/config.cache' and start over
    configure failed for srclib/pcre


On a good note, I've spotted [NeoMPC being used in the field](http://rin3y.livejournal.com/135269.html)!
