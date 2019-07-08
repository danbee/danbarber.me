---
title: Basics of Linux Server Administration, Part 1
date: Tue, 19 Dec 2006 00:00:00 +0000
categories:
- blog
- geek
- linux
layout: post
---

<img src="/images/discspace.png" class="left" />

I have decided to start writing a small series of posts based on things I have learnt over the past few years.  I run a small group of Linux servers -- mostly web application servers running PHP, MySQL and PostgreSQL -- with a variety of different distributions; some of them are running Gentoo Linux, a couple of others are running Debian or Ubuntu, and I've installed Fedora Core 6 on my home server, but the majority of what I've learnt (and will talk about here) is universal and will apply equally to all Linux distro's.

In this article I'm going to cover disk space.

<!-- more -->

The Problem
------------

In an ideal world disks would have an infinite amount of space, but unfortunately that's not the case.  The consequences of running out of space on a server can be catastrophic, and will often bring a server to its knees very swiftly.  Services often fail when they can’t write to their logs or create temporary files, so monitoring disk usage is a vital part of an administrators job.

Keeping an Eye
--------------

We can monitor disk space on a Linux server with the `df` command.  Here is an example of the output from one of my servers:

	piro danbee # df
	Filesystem           1K-blocks      Used Available Use% Mounted on
	/dev/hdc3             10238812   2596020   7122688  27% /
	udev                    241904       176    241728   1% /dev
	/dev/hdc4            181436296 119808716  52411092  70% /home/media/data
	shm                     241904         0    241904   0% /dev/shm

There are a number of options we can pass to `df` to make its output more readable.  The `-h` option will tell `df` to show the sizes 'human readable':

	piro danbee # df -h
	Filesystem            Size  Used Avail Use% Mounted on
	/dev/hdc3             9.8G  2.5G  6.8G  27% /
	udev                  237M  176K  237M   1% /dev
	/dev/hdc4             174G  115G   50G  70% /home/media/data
	shm                   237M     0  237M   0% /dev/shm

As you can see, that's much more readable. :)

Long Term
---------

As a long term solution, wouldn't it be nice if the server kept a check on disk space and let you know when it was getting a bit low?  The easiest way to deal with this is by setting up a script that checks the disk space on selected partitions regularly, and alerts us somehow when remaining disk space drops below a pre-defined level.

The most obvious alert method would be email, so that's what we use here.  The `mailx` command will let us easily send an email.  If your distro hasn't already got it, you should be able to install it easily using your default package manager.

Anyway, without further ado, here is the script:

	#!/bin/sh
	
	# Disk space checker script
	# -------------------------
	
	# Set warning and low limit to 1.5gb and 1gb
	warninglimit = 1500000
	lowlimit = 1000000

	# File systems to check
	filesystems = "/home /var /"

	# Email address to send alerts to
	alert_email = "fakeemail@fakedomain.com"

	# Loop through filesystems
	for fs in $filesystems
	do
	        # Get the remaining space on this filesystem
	        size=`df -k $fs|grep $fs|awk '{ print $3; }'`
		
	        if [[ $size -le $lowlimit ]]
	        then
			echo "URGENT: Low disk space for $fs ($size) on $HOSTNAME" > email_message.txt
                        mailx -s "URGENT: Low disk space for $fs ($size) on $HOSTNAME" $alert_email < email_message.txt

	                break
	        fi

	        if [[ $size -le $warninglimit ]]
	        then
			echo "WARNING: Low disk space for $fs ($size) on $HOSTNAME" > email_message.txt
                        mailx -s "WARNING: Low disk space for $fs ($size) on $HOSTNAME" $alert_email < disc_space_warning.txt
		fi
	done

Copy this to a file somewhere on your server (something like `/usr/scripts/check_disks.sh`), make it executable and symlink it from `/etc/cron.daily` or `/etc/cron.hourly`.

	# chmod +x /usr/scripts/check_disks.sh
	# ln -s /usr/scripts/check_disks.sh /etc/cron.daily/check_disks

Or, if you haven't got an `/etc/cron.daily` directory, add a line to your `crontab` file that reads something like the following.

	00 01 * * * root /usr/scripts/check_disks.sh

Doing it this way will also allow for more flexibility in when you want the script to check.



