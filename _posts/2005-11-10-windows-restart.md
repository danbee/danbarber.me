---
title: Windows Restart
date: Thu, 10 Nov 2005 00:00:00 +0000
categories:
- blog
- news
layout: post
---

<img src="/images/nowindowsupdate.png" class="left" />

Relating to my <a href="http://www.pixelhum.com/archives/2005-05-26/windows-update-blues/">post in August</a> and <a href="http://binarybonsai.com">Michael's</a> <a href="http://binarybonsai.com/archives/2005/11/09/restart-windows/">recent post</a>, here is the registry fix in question.  The fix prevents Windows Update from automatically restarting your machine if any users are logged in, thus preventing any data loss.

<br clear="left" />

<pre><code>Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU]
"NoAutoRebootWithLoggedOnUsers"=dword:00000001


</code></pre>

Download: <a href="http://www.pixelhum.com/stuff/windowsupdate/aunoreboot.reg">aunoreboot.reg</a>



