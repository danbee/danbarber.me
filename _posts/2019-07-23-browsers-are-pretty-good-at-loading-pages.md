---
title: Browsers are pretty good at loading pages, it turns out
layout: post
categories:
- blog
tags:
- html
- javascript
- web
- www
date: Tue, 23 Jul 2019
---

[Carter Sande](https://carter.sande.duodecima.technology/javascript-page-navigation/):

> The <a> tag is one of the most important building blocks of the Internet. It
> lets you create a hyperlink: a piece of text, usually colored blue, that you
> can use to go to a new page. When you click on a hyperlink, your web browser
> downloads the new page from the server and displays it on the screen. Most web
> browsers also store the pages you previously visited so you can quickly go
> back to them. The best part is, the <a> tag gives you all of that behavior for
> free! Just tell the browser where you want to go, and it handles the rest.
>
> Lately, though, that hasn’t been enough for website developers. The new fad is
> “client-side navigation”, where instead of relying on the browser to load new
> pages for you, you write a bunch of JavaScript code to do it instead. It’s
> actually really hard to get it right—loading the new page is simple enough,
> but you also have to write code to display a loading bar, make the Back and
> Forward buttons work, show an error page if the connection drops, and so on.

So much this! The trend towards building a website/web app as a Javascript front
end talking to an API makes web development more complicated than it needs to
be. Many of these sites could (and should) be server rendered HTML.
