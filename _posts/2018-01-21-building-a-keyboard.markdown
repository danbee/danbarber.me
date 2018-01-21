---
title: "Building a Keyboard"
layout: post
categories:
- hardware
- electronics
- keyboards
date: 2018-01-21T17:38:21+00:00
---

<figure>
  {% picture full-width blog/building-a-keyboard/DSCF7141.jpg
     alt="My custom keyboard" %}
</figure>

When I realised I'd be staying in the US, I realised it would be cheaper to sell
my current mechanical keyboard to someone back in the UK and buy myself a new
one here. It would also give me the opportunity to try something a bit
different.

<!-- more -->

Since I bought my first mechanical keyboard the hobby has exploded, with many
options available. The problem I started to notice is that it was possible to
get anything you wanted provided it was in the US ANSI layout. Being a Brit and
a Mac user, my choices were more limited. I decided that, since I had a lot of
free time on my hands, I would build my own.

This would give me a number of advantages over a pre-built keyboard. The first
is that I get to choose exactly what switches I want. The second is that most
PCB's available to self builders use firmware that allows the keyboard to be
fully programmable. In other words, I would be able to make any key do whatever
I wanted it to do. As you can imagine, this appealed!

### Size and Layout

There's a staggering number of choices when it comes to size and layout options,
from full size and ten keyless to 60% and 40% size layouts, all the way to
esoteric split designs and ortholinear layouts. I settled on 60% because
I figured I could get by without function keys and I'm so used to Vim arrow keys
that I could just map those keys to a function layer for use anywhere. There are
also plenty of options when it comes to building 60% sized boards.

### Switches

After some research I decided that I wanted either Zealio or MOD switches, so
I ordered a couple of switch testers from NovelKeys to try them out. I quickly
decided that the Zealio switches were the way forward as they felt much smoother
to me, with a longer, rounder tactile bump compared to the MODs.

I ordered the switches directly from
[ZealPC](https://zealpc.net/collections/switches/products/zealio) and added
Cherry stabilisers to the order.

### PCB

There are plenty of choices when it comes to 60% keyboard PCB's (GH60, Nerd60,
FaceW, Satan, Zeal60, DZ60). The Zeal60 looked interesting at first--I felt it
would be a good match for the Zealio switches--but I dismissed it early on due
to it's price and the fact that I didn't want RGB backlighting.

I ended up going for the GH60 because it seemed like the most open option and
had everything I needed. It's also nice to support open hardware where possible.

I ordered the PCB in black from
[Techkeys.us](https://techkeys.us/collections/accessories/products/gh60).

### Plate

It's not strictly necessary to have a plate, but it makes the keyboard feel more
solid and better to type on. Surprisingly this was the hardest part to source as
most pre cut plates are either ANSI layout or they are universal, meaning they
have enough cut outs to support many different layouts, including ISO. The
problem with these plates is that some of the switches are not held particularly
securely due to the extra cut outs. After some fruitless searching I decided to
get my own plate cut out of 1.5mm stainless steel. This was relatively
expensive—about double the price of a pre-cut plate—but it meant I got exactly
what I wanted.

The plate was cut by [Lasergist](http://lasergist.com).

### Keycaps

Because I wanted full control over what was printed on the keycaps there was
really only one option and that was to get them custom printed by [WASD
Keyboards](http://www.wasdkeyboards.com/index.php/products/keycap-set/62-key-cherry-mx-keycap-set.html).
I had created a custom layout using their template for full size and TKL
keyboards, so I took the same file and modified it for a
[62 key layout](https://github.com/danbee/wasd-mac-uk-layout/pull/2). I got the
modifiers in black and the alpha keys in dark grey for a Dolch style two tone
look.

### Case

The last thing I needed was a case. I'd decided early on that I wanted a high
profile, silver aluminium case that would match well with my MacBook Pro.
I ended up picking [this case](https://kbdfans.myshopify.com/products/mechanical-keyboard-shell-anode-aluminum-shell-gh60-poker-60-mechanical-keyboard-shell?variant=36017578253)
from KBDFans. It was heavier than I expected, even without the added steel
weight!

<figure>
  {% picture full-width blog/building-a-keyboard/DSCF7133.jpg
     alt="The keyboard case." %}
  <figcaption>The case. It's heavy!</figcaption>
</figure>

### Building the board

Before I started building the board I needed to test the PCB. The board arrived
with no firmware installed so I flashed the default GH60 EasyAVR firmware to the
board using `dfu-programmer`. Then I could test each switch location by bridging
the pads on the PCB with a paperclip. Everything worked just fine so I started
putting it all together.

The first thing I needed to do was to clip and lube the stabilisers. Cherry
stabilisers can feel mushy and change the feel of the keys unless they are
modded by [clipping two little plastic parts off the bottom of the
inserts](https://youtu.be/C6hPoe3srcw). Lubricating them helps to reduce their
influence on the key feel even more. I used some Krytox lube that I ordered from
[Techkeys.us] for this, putting a thin coat on the stems and on the stabilising
wires where they contact the plastic parts.

Once the stabilisers were mounted onto the PCB I started placing the switches in
the plate, starting with the four corners so I could get the plate and PCB
aligned. Then I started fitting the rest of the switches, making sure they were
seated fully into the PCB--the mounting legs fit tightly into the holes on the
PCB.

<figure>
  {% picture full-width blog/building-a-keyboard/DSCF7125.jpg
     alt="The plate with PCB and switches mounted." %}
  <figcaption>The switches all in place.</figcaption>
</figure>

Once the switches were all fitted it was a simple matter of soldering all the
legs to the pads on the PCB. I don't own a soldering iron myself so I used the
services of the wonderful [Hack Manhattan](https://hackmanhattan.com) hack
space. This was my first time doing through hole PCB soldering and I was
a little nervous about messing it up so I was sure to read plenty of guidance on
the Internet and watch a couple of Youtube videos. In the end it wasn't actually
that tricky! The secret is using a temperature controlled iron and being sure to
heat both the leg of the switch and the PCB pad at the same time. This is what
makes the solder flow nicely and form a good connection.

<figure>
  {% picture full-width blog/building-a-keyboard/IMG_6757.jpg
     alt="The back of the PCB with the switches soldered." %}
  <figcaption>All soldered up.</figcaption>
</figure>

After I'd soldered each row I connected the keyboard to my computer to test all
the switches I'd just soldered. I used a website called [Keyboard
Tester](http://www.keyboardtester.com) for this.

<figure>
  {% picture full-width blog/building-a-keyboard/IMG_6758.jpg
     alt="The keyboard hooked up to my laptop to test the switches." %}
  <figcaption>Testing the switches.</figcaption>
</figure>

With all the switches soldered into place and tested it was time to put the
board into its case and fit the keycaps to the switches. The PCB and plate
sandwich is mounted in the case using five screws through holes in the PCB. The
screw layout follows the popular Pok3r layout which makes it compatible with
many other 60% options.

I started on the keycaps by fitting the large, stabilised keys first. The enter
key, space key and right shift key. Then I just worked my way down row by row
until I was all done.

<figure>
  {% picture full-width blog/building-a-keyboard/DSCF7138.jpg
     alt="The keyboard partway through fitting the keycaps" %}
  <figcaption>Fitting the last few keycaps.</figcaption>
</figure>

I'm super pleased with the finished board! It's a pleasure to type on although
it took me a few days to get used to the 60% layout. I also made a bunch of
tweaks to the key layout (now using the [QMK firmware](http://qmk.fm)) which
means the key legends no longer reflect what the keys do. I plan to get
reprinted keycaps. My current keymap is
[here](https://github.com/danbee/qmk_firmware/blob/gh60-danbee/keyboards/gh60/keymaps/danbee/keymap.c).

<figure>
  {% picture full-width blog/building-a-keyboard/DSCF7145.jpg
     alt="The keyboard hooked up to my laptop." %}
</figure>
