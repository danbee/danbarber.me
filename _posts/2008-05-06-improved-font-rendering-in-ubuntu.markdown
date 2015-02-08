---
layout: post
title: "Improved Font Rendering in Ubuntu"
categories: [linux, ubuntu, fonts, firefox, autohint]
published: true
---

There's quite a few posts of this type around the web, I just thought I'd document what seems to work best for me. The main thing this fixes is font rendering in Firefox, now it looks just as nice as it does in Epiphany!

Put the following in ~/.fonts.conf:

``` xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="font">
    <edit mode="assign" name="rgba">
      <const>none</const>
    </edit>
  </match>
  <match target="font">
    <edit mode="assign" name="hinting">
      <bool>true</bool>
    </edit>
  </match>
  <match target="font">
    <edit mode="assign" name="hintstyle">
      <const>hintmedium</const>
    </edit>
  </match>
  <match target="font">
    <edit mode="assign" name="antialias">
      <bool>true</bool>
    </edit>
  </match>
  <match target="font">
    <edit mode="assign" name="autohint">
      <bool>true</bool>
    </edit>
  </match>
</fontconfig>
```
