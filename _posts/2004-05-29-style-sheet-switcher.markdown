---
layout: post
title: "Style Sheet Switcher"
categories: [clockrocket]
published: true
---

We all know that the idea behind <acronym title="eXtensible Hypertext Markup Language">XHTML </acronym>and <acronym title="Cascading Style Sheet">CSS</acronym> is to seperate content from style, and when this is done properly it allows us to change the design of an entire site simply by changing the <acronym title="Cascading Style Sheet">CSS</acronym> stylesheet.  So why not have multiple stylesheets for your website and allow the user to change them?

What follows is a step by step guide to exactly how I achieved the stylesheet switcher on ClockRocket.

<!-- more -->

<h3>Preparations</h3>

For this to work properly all elements relating to the 'design' of the page must be contained in the <acronym title="Cascading Style Sheet">CSS</acronym>.  I won't go into any details about that here, but there are plenty of articles on the web about image replacement techniques.  On such article can be found at Stopdesign; '<a href="http://www.stopdesign.com/also/articles/replace_text/" title="Read the article &lsquo;Using Background-Image to Replace Text&rsquo; at Stopdesign">Using Background-Image to Replace Text</a>'.

<h3>The Switcher Code</h3>

The first thing we will do is write some code that picks up a GET variable (which we will call 'style') and set a cookie for our dynamic stylesheet to pick up.  We will put this code into an empty file and call it 'setstyle.php'.

<pre><code>&lt;?php
    if ($_GET['style']) {
        setcookie(&quot;style&quot;, &quot;$style&quot;, time() + 315360000, &quot;/&quot;);
    }
?&gt;</code></pre>

The 'style' variable will equal the name of the <acronym title="Cascading Style Sheet">CSS</acronym> file we want to change to, without the .css extension, eg. if your stylesheet is called 'default.css', then 'style' will equal 'default'.

We need to reference this file in our index page now.  Your index page must have a .php extension for this to work.  Add the following line to the top of your index page.

<pre><code>&lt;?php include(&quot;&lt;$MTBlogSitePath$&gt;setstyle.php&quot;);?&gt;</code></pre>

<h3>The Stylesheet</h3>

We are going to create the master stylesheet now.  This will be the file referenced by the <acronym title="HyperText Markup Language">HTML</acronym> and will be written in <acronym title="PHP Hypertext Preprocessor">PHP</acronym>.  Basically we are taking advantage of the fact that <acronym title="PHP Hypertext Preprocessor">PHP</acronym> can return data for any filetype.

Here is the code.  Put this in a new file and call it 'site-styles.php'.

<pre><code>&lt;?php
    if (!$_COOKIE['style']) {
        /* here we check to see if the cookie exists
        and if it doesn't, set a default stylesheet */
        $style = &quot;default&quot;;
    }
    /* output the correct HTTP header for the stylesheet */
    header(&quot;Content-Type: text/css&quot;);
    /* output the stylesheet itself */
    include(&quot;$style.css&quot;);
?&gt;</code></pre>

This file needs to be referenced in your code in the place where you would normally reference the normal stylesheet.  So change the appropriate line in your <acronym title="HyperText Markup Language">HTML</acronym> to refer to 'site-styles.php'.

<pre><code>&lt;link rel=&quot;stylesheet&quot; href=&quot;styles-site.php&quot; type=&quot;text/css&quot; /&gt;</code></pre>

<h3>Allowing the user to change the Stylesheet</h3>

As of now, you should be able to change stylesheets by adding '?style=[style]' to your index <acronym title="Universal Resource Locater">URL</acronym> in the browser window.  But that's not very convenient or intuative for the user!  So the last step is to create a way of letting the user change the stylesheet.

We can do this a couple of ways.  I chose to use a form with a combo box and submit button to list the stylesheets, but you can just as well use a list of links, each linking to the <acronym title="Universal Resource Locater">URL</acronym> required for each stylesheet.  Example code for each technique follows.

<h4>The Form Method</h4>

<pre><code>&lt;form method=&quot;get&quot; action=&quot;index.php&quot;&gt;
    Style:&lt;br /&gt;&lt;select name=&quot;style&quot;&gt;
        &lt;option value=&quot;default&quot;&lt;?php if ($style == &quot;default&quot;) { echo &quot; selected=\&quot;selected\&quot;&quot;; } ?&gt;&gt;Default Stylesheet&lt;/option&gt;
        &lt;option value=&quot;another&quot;&lt;?php if ($style == &quot;another&quot;) { echo &quot; selected=\&quot;selected\&quot;&quot;; } ?&gt;&gt;Another Style&lt;/option&gt;
        &lt;option value=&quot;different&quot;&lt;?php if ($style == &quot;different&quot;) { echo &quot; selected=\&quot;selected\&quot;&quot;; } ?&gt;&gt;Different Style&lt;/option&gt;
    &lt;/select&gt;&nbsp;&lt;input type=&quot;submit&quot; class=&quot;button&quot; value=&quot;Go&quot; /&gt;
&lt;/form&gt;</code></pre>

<h4>The Links Method</h4>

<pre><code>&lt;a href=&quot;index.php?style=default&quot;&gt;Default Stylesheet&lt;/a&gt;&lt;br /&gt;
&lt;a href=&quot;index.php?style=another&quot;&gt;Another Stylesheet&lt;/a&gt;&lt;br /&gt;
&lt;a href=&quot;index.php?style=different&quot;&gt;Different Stylesheet&lt;/a&gt;&lt;br /&gt;</code></pre>

And that should be that!  Comments are appreciated.
