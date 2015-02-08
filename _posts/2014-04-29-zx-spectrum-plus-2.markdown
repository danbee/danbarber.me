---
layout: post
title: "ZX Spectrum +2"
date: 2014-04-29T08:28:00+01:00
categories: 
---

<figure>
  {% picture full-width blog/zx-spectrum-plus-2/5364873704_0fe55f7e3e_o.jpg alt="ZX Spectrum" %}
	<figcaption class="attribution"><a href="https://www.flickr.com/photos/gonzalomerat/5364873704">Photo</a> by Gonzalo Merat / <a href="https://creativecommons.org/licenses/by-nc-nd/2.0/">CC BY NC ND</a></figcaption>
</figure>

The second computer to ever enter my life was a Sinclair ZX Spectrum +2. This machine had colour, 3 channel sound and a built in tape deck. I was in love!

<!-- more -->

The ZX Spectrum was the successor the popular ZX81 and was first released in 1982. The first model had 16Kb or 48Kb of RAM and a simple beeper for sound. It came with the rubber key membrane keyboard that made it famous. It was better than the keyboard on the ZX81 but still not great.

The ZX Spectrum was so named because of it's ability to display colour. It had a palette of 8 colours. In order to reduce the amount of memory required for the screen buffer the colour resolution was limited to 2 colours per 8×8 pixel block. This led to the infamous 'colour clash' effect often seen in games.

The ZX Spectrum + 128 was released in 1985 (1986 in the UK) and featured 128k of RAM and improved 3 channel sound courtesy of the [AY-3-8912](http://en.wikipedia.org/wiki/AY-3-8912) chip. The extra memory was accessed by page switching 16kb chunks into the top of the Z80's 64Kb address space. The 128 had the same improved keyboard as the earlier 48k + model.

The 128k + wasn't around long. Amstrad bought Sinclair -- including the rights to the ZX Spectrum -- in 1986. The ZX Spectrum +2 was the first model to come out of this deal and was based on the same mainboard as the 128k + but in a new case which featured a built in tape deck and an improved keyboard. This was the model I owned.

This was the machine that really got me started with programming. It started with typing in BASIC program listings from magazines and figuring out how they worked. My dad and I would also type in line after line of machine code in hex dump format. This was remarkably prone to error and so the success rate was low! When it worked though the results could be pretty spectacular compared to what was possible with BASIC alone.

<figure>
  {% picture full-width blog/zx-spectrum-plus-2/IMG_1950.jpg alt="UDG on graph paper" %}
</figure>

I learned binary on the Spectrum completely by accident. In order to create graphics for BASIC programs it was necessary to create UDG characters. These were defined as an 8x8 grid which was represented in memory by 8 bytes. You'd design your sprite on graph paper, then add up all the numbers to derive the byte that should represent each row. These were then poked into memory. It only occurred to me later that each row was a binary number!

We had a variety of upgrades attached to this machine over the years. The first was the AMX Mouse which, along with [OCP Art Studio](http://www.worldofspectrum.org/infoseek.cgi?regexp=^OCP+Art+Studio%2c+The$&loadpics=1), enabled me to dabble with computer art. Later on we added an MGT +D disk interface, with a 3.5" disk drive. This meant I could load an entire 128k game in 10 seconds rather than waiting 5 minutes for the tape to load. This was a game changer!

### Games

It would be somewhat remiss of me to write an article about the ZX Spectrum without mentioning the games! The price and subsequent popularity of the Spectrum meant that a great many games were released for it. I have fond memories of playing the likes of Manic Miner, Head Over Heels, Rainbow Islands and Batman the Movie.

<figure>
  <img src="http://danbarber.me.s3.amazonaws.com/zx-spectrum-plus-2/games.png" alt="Spectrum games selection">
  <figcaption>Rainbow Islands, Head Over Heels, Batman the Movie, Fantasy World Dizzy</figcaption>
</figure>

Some software houses that started with the Spectrum are still around today. The most notable example is [Codemasters](http://www.codemasters.com/uk/). Formed by David and Richard Darling in 1986, they quickly became famous for the "Simulator"[^simulator] series of games and the Dizzy series.

### Music

The original ZX Spectrum had nothing more than a simple 1-bit beeper for sound, but the 128k version with it's AY 3-channel sound chip could do much more. Musicians like [David Whittaker](http://en.wikipedia.org/wiki/David_Whittaker_(video_game_composer)) and [Allister Brimble](http://en.wikipedia.org/wiki/Allister_Brimble) created some amazing tunes for games, and a few games even incorporated speech!

The 128k had another musical trick up it's sleeve. The RS232 port could be used as a MIDI port with the right cable. This enabled the standard BASIC PLAY command to output MIDI signals to the connected instrument, and it was possible to control multiple instruments using the MIDI through facility --- provided the instruments implemented it. 

### Now

The ZX Spectrum is still very much alive. It is still a very popular machine in the [demoscene](http://en.wikipedia.org/wiki/Demoscene) and there are even games and software [still being written](http://www.worldofspectrum.org/whatsnew.html) for it. Hardware projects such as the [divIDE](http://baze.au.com/divide/) have enabled the use of modern peripherals and emulators are available for practically every platform imaginable.

Long live the ZX Spectrum!

[^simulator]: Way before the current crop of simulator titles.

*[BASIC]: Beginners All Purpose Symbolic Instruction Code
*[UDG]: User Defined Graphic
*[MGT]: Miles Gordon Technology
*[OCP]: Oxford Computer Publishing
*[MIDI]: Musical Instrument Digital Interface
