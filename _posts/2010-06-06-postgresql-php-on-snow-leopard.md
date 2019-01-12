---
title: PostgreSQL &amp; PHP on Snow Leopard
date: 2010-06-06 00:00:00 Z
categories:
- php
- mac-os-x
- postgresql
layout: post
---

I recently had to install PostgreSQL on Snow Leopard with PHP support for development. It took some fiddling and a re-install when I screwed up a dependency but I eventually managed to do it! I thought I'd document the process here for anybody else in the same boat.

<!-- more -->

My first approach was to install PostgreSQL using the one click installer from EnterpriseDB and recompiling PHP from scratch, but I scrapped that in favour of installing it via Homebrew, and only compiling the necessary PHP extensions.

### Homebrew & PostgreSQL

[Homebrew](http://mxcl.github.com/homebrew/) is a rather natty new package manager for Mac OS X that takes a lot of the pain out of installing Unix software on the platform.

Install it using the instructions here: [Homebrew Installation Instructions](http://wiki.github.com/mxcl/homebrew/installation).

You will also need Xcode for this, as Homebrew compiles from source. Also, we're going to be doing some compiling of our own too. Grab [Xcode](http://developer.apple.com/tools/xcode/) and install it.

The next step is to install PostgreSQL using Homebrew. Install it with the following command:

``` bash
$ brew install postgresql
```

You will see some instructions pop up once PostgreSQL is compiled. The most important ones are the `initdb` command and the command to launch Postgres on login:

``` bash
$ initdb /usr/local/var/postgres
$ launchctl lad -w /usr/local/Cellar/postgresql/8.4.4/org.postgresql.postgres.plist
```

### Compiling the PHP extensions

There are two PHP extensions that allow PHP to access PostgreSQL. You may only need the standard PHP pgsql library, but the PDO driver is so easy to install you might as well add it anyway.

Grab the source code for PHP. The version running on 10.6.3 is [PHP 5.3.1](http://php.net/get/php-5.3.1.tar.bz2/from/a/mirror) so I grabbed the bzipped tar of that.

Move the source code somewhere suitable and extract it:

``` bash
$ mkdir ~/Source
$ cd ~/Source
$ mv ../Downloads/php-5.3.1.tar.bz2
$ tar -xjvf php-5.3.1.tar.bz2
```

Now we need to find the pgsql extension and compile it:

``` bash
$ cd php-5.3.1/ext/pgsql
$ phpize
$ ./configure --with-pgsql=/usr/local
$ make && sudo make install
```

Next we need to grab the PDO_pgsql extension using PECL and compile and install that:

``` bash
$ cd ~/Source
$ sudo pecl download pdo_pgsql
$ tar -xzvf PDO_PGSQL-1.0.2.tgz
$ cd PDO_PGSQL-1.0.2
$ phpize
$ ./configure --with-pdo-pgsql=/usr/local
$ make && sudo make install
```

Now those are installed we just need to add the extensions to the PHP configuration. Copy the default php.ini to a new file like so:

``` bash
$ cd /private/etc
$ cp php.ini.default php.ini
```

Then add the following lines to the Dynamic Extensions section of your new php.ini file using your favourite editor (I like nano):

``` ini
extension=pgsql.so
extension=pdo_pgsql.so
```

Lastly, restart Apache:

``` bash
$ sudo apachectl restart
```

### References

I used information in the following web pages in the preparation of the guide:

[Gnegg - Snow Leopard and PHP](http://www.gnegg.ch/tag/snow-leopard)

[StackOverflow - Installing PDO-drivers for PostgreSQL on Mac](http://stackoverflow.com/questions/61747)
