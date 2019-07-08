---
title: Internet Explorer and PNG's
date: Thu, 3 Jun 2004 00:00:00 +0000
categories:
- blog
- clockrocket
layout: post
---

It's the bain of every Web Developers life.  The one thing that would make all our lives just that little bit nicer.  Proper support for PNG's in all common web browsers.

<!-- more -->

I'd kind of gotten over the fact that Internet Explorer doesn't, and probably never will, support alpha transparent PNG files.  I guess it's because Microsoft don't see the need for them on their site.

What has been bugging me is the fact that PNG images always seemed to display slightly too dark in IE.  Very irritating if you have an image that needs to match a colour specified in your CSS file.

So I decided last night to try and find out why this happens, and it turns out the Internet Explorer doesn't handle the <a href="http://www.libpng.org/pub/png/spec/1.2/PNG-Chunks.html#C.gAMA" title="Look up details about the gAMA chunk on libpng.org">gAMA</a> chunk correctly, and the solution to this is to use <a href="http://pmt.sourceforge.net/pngcrush/index.html" title="Visit the pngcrush page.">pngcrush</a> to remove the gAMA chunk and the <a href="http://www.libpng.org/pub/png/spec/1.2/PNG-Chunks.html#C.cHRM" title="Look up details about the cHRM chunk on libpng.org">cHRM</a> chunk and put in a <a href="http://www.libpng.org/pub/png/spec/1.2/PNG-Chunks.html#C.sRGB" title="Look up details about the sRGB chunk on libpng.org">sRGB</a> chunk.

It's all a bit technical but, rest assured, the command below will correct your PNG files so they display at the correct brightness in Internet Explorer.

<pre><code><b>#</b> pngcrush -srgb 1 -rem gama -rem chrm [infile].png [outfile].png</code></pre>

At some point in the near future i'll write a bash script or something to automate fixing directories of files as it's a bit of a pain to do one file at a time.



