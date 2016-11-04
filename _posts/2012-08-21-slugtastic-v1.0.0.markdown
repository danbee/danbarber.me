---
title: Slugtastic v1.0.0
date: 2012-08-21 10:09:00 Z
categories:
- rubygems
- gem
- rails
- coding
layout: post
comments: true
---

I've just released my first proper Ruby gem. It's a simple permalink style slug generator for ActiveModel. Check it out at [Github](https://github.com/danbee/slugtastic) and use it in your Rails project by adding `gem "slugtastic"` to your Gemfile.

Usage is very simple. Just add the following to your model:

``` ruby
has_slug :slug, :from => :title
```

This will generate a slug string from the title attribute and store it in the slug attribute unless the slug already contains a string. The slug is generated pre-validation so you can still use `validates_presence_of :slug`.
