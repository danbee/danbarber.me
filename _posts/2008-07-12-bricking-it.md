---
title: Bricking It
date: Sat, 12 Jul 2008 00:00:00 +0000
layout: post
categories:
- blog
---

I've finally got IPv6 working on my home network. It took a fair bit of fiddling! I'm using a tunnel and subnet provided by [SixXS](http://www.sixxs.net/), which is run from a Linksys WRT54GS router running [OpenWRT](http://openwrt.org/). I've had the tunnel running for a while, but it was only today that I got the subnet and was able to setup radvd to broadcast it. It does seem that radvd doesn't like broadcasting /48 subnets though so I had to change it to a /64 to get it working.

By the way, never ever *ever* try uninstalling libgcc from an [OpenWRT](http://openwrt.org/) based router. In a moment of space clearing madness I did (trying to make room for IPv6 tools), and luckily was able to fix it by relinking the /lib/libc.so.0 file back to the right place.

    # ln -s /lib/libc.so.0 /lib/libgcc_s.so.1

I really thought I'd bricked my router...



