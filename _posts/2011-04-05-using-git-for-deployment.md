---
title: Using Git for Deployment
date: 2011-04-05 00:00:00 Z
categories:
- web
- deployment
- git
layout: post
---

I've been using Git for deployment now for some time, and I thought it might be helpful to others if I document how I did it. Partly this is because I can't find the original guide that I used, so if you recognise the method I use here and you did it first, let me know and I'll attribute you!

**Update**: This is the original article: [http://joemaller.com/990/a-web-focused-git-workflow/](http://joemaller.com/990/a-web-focused-git-workflow/). Thanks to Tim for the link in his comment!

For the purposes of this guide I'm going to assume that you have your website live already, and that it is not already in a Git repository. If your situation is different you will have to adapt the steps accordingly.

<!-- more -->

### Setting up the server

In order for this to work it will require two repositories on the server itself. The actual live production code will reside in it's own repo, and we will have a bare "hub" repository that will act as the master copy. Local changes will be pushed to the "hub" and will then be pulled into the live repo by a post-update hook.

We'll start by initialising a repository in the live code directory on the server and committing the entire codebase. We'll call our site "myproject" and we'll assume it resides in `/var/www/myproject`.

``` bash
$ cd /var/www/myproject
$ git init
Initialized empty Git repository in /var/www/myproject
$ git add .
$ git commit
```

The next step is to create a bare repository, also on the server, and push the live repo into it. I put these in `/var/git`, but you can put them where ever you like. You just need to make sure you can write to them.

``` bash
$ mkdir -p /var/git/myproject.git
$ cd /var/git/myproject.git
$ git init --bare
$ cd /var/www/myproject
$ git push /var/git/myproject.git master
Counting objects: 143, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (87/87), done.
Writing objects: 100% (143/143), 288.28 KiB, done.
Total 143 (delta 52), reused 129 (delta 47)
To /var/git/myproject.git
* [new branch]      master -> master
```

#### Configuration and hooks

We need to make sure that the "hub" repository is configured as a remote for the live repository. To do this we edit `/var/www/myproject/.git/config` and add the following lines to the end:

```ini
[remote "hub"]
  url = /var/git/myproject.git
  fetch = +refs/heads/*:refs/remotes/hub/*
```

Next we need to set up a couple of hooks. The first of these will make sure that any time anything is pushed to the hub repository it will be pulled into the live repo. This hook can also contain anything that needs to happen to deploy the new version (not necessarily relevant to PHP/HTML websites but is needed for Ruby on Rails and probably Django sites too).

Git repository hooks are stored in the `.git/hooks` directory or `hooks` directory (in the case of a bare repo) within the repository, so we need to create the file `/var/git/myproject.git/hooks/post-update`:

``` sh
#!/bin/sh

echo
echo "**** Pulling changes into Live [Hub's post-update hook]"
echo

cd /var/www/myproject || exit
unset GIT_DIR
git pull hub master

exec git-update-server-info
```

We need to make sure this file is executable:

``` bash
$ chmod +x /var/git/myproject.git/hooks/post-update
```

The second hook is not essential, but is just to make sure that any 'in place' changes we make to the web code is pushed to the hub when committed. This means we can safely make code changes directly on the server (not that I'd ever recommend this!). This one goes in the live repo so we need to create a file at `/var/www/myproject/.git/hooks/post-commit`:

``` sh
#!/bin/sh

echo
echo "**** pushing changes to Hub [Live's post-commit hook]"
echo

git push hub
```

Again, ensure this file is executable.

``` bash
$ chmod +x /var/www/myproject/.git/hooks/post-commit
```

This should be all the setup we need on the server.

### Cloning and pushing live

The next step is to pull down a working copy of the site to the development box (this could be your own desktop/laptop machine or it could be a dedicated development server). I put all my local development sites in `~/Sites`.

``` bash
$ cd ~/Sites
$ git clone dan@server:/var/git/myproject.git myproject
```

That's pretty much it! Any changes committed to the master branch can now be pushed live with the following command:

``` bash
$ git push origin master
```

### More examples

My photography portfolio site is built in Rails and consequently needs a bit more than a straightforward pull to set the new version live. We need to run a couple of commands to make sure that any database migrations are added to the production database, and also to make sure any new or updated gems are installed. We also need to reload apache to ensure that Passenger reloads our app:

```sh
#!/bin/sh

echo
echo "**** Pulling changes into Live [Hub's post-update hook]"
echo

cd /var/www/danbarberphoto || exit
unset GIT_DIR
git pull hub master
sudo bundle install
rake db:migrate RAILS_ENV="production"
sudo /etc/init.d/apache2 reload

exec git-update-server-info
```

------------------------------------------

### Comments

This was one of the few articles on my blog that attracted some useful comments, so I'm reproducing them here for posterity.

#### [Tim](http://www.shiropetto.net/) —posted 26 June, 2011

I very much like this setup and have been using it in my production environment with the company I work for.

I originally read a original article a year or so ago at <http://joemaller.com/990/a-web-focused-git-workflow/>

Extended the post-hooks a little to update submodules and will be looking at tags for version releases.

nicely put together! Cheers!

#### Dan Barber —posted 27 June, 2011

Hi Tim, thanks for your comment. And thanks for the link, that’s the article I refer to at the top of my post. I’ll update my article to include it.

I’d be interested to hear about how you use tags.

#### Gerhard —posted 17 days ago

Very nice indeed!

I like some visibility to my deploys though (too many things can go wrong in bigger apps which include multiple services). Even if very opinionated, it works really well for our apps: https://github.com/gerhard/deliver .

#### Graham —posted 16 days ago

Why is this considered preferable to having a CI environment push the changes out to live? The CI environment can then only do so if the unit tests all pass - you do have unit tests, right? - and you get decent views of the history. You also have a fairly trivial way of pushing out to other machines hosting the site - so you can have the CI server installed in one internal machine pushing out automatically to multiple external machines as appropriate…

#### Dan Barber —posted 16 days ago

Graham, thanks for your comment. A CI environment is not appropriate for every project though. Static websites are one such example.

#### Joe —posted 11 days ago

Have you seen this article about using git to deploy websites? — http://toroid.org/ams/git-website-howto

Not sure how much better or worse it is, but it is what I have been doing for about two years. The above solution does not require you to use an .htaccess file to hide the .git directory because it never makes it to the application root.

#### JustSomeNoob —posted 11 days ago

Forgive my cluelessness, but why can’t you simply push directly to repository that’s serving the code? What is the advantage of having the intermediary repository and the post-push hook?

I’m sure that I must be missing something, but I guess what I really need is the use case for this setup (spelled out as if I’m 5).

Thanks!

#### danbee —posted 10 days ago

Joe - I hadn’t seen that article, but on first glance it looks very similar to my approach. The main difference is that it does a checkout to the web directory rather than a pull. The advantage of having the application root a git repository is that it makes it possible to make code changes directly on the server and commit them to the repository, not that I’d recommend this!

JustSomeNoob - That’s a good question that I really should have covered. Git does not allow you to push directly to a working repository, hence the need for the intermediate bare repo. It would be worth reading Joe Maller’s article (linked at the top of the post) as he explains things a bit better than I do!
