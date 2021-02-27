---
title:  "Jekyll on Windows 10 WSL2 with auto-regeneration"
tags: documentation-tools jekyll
date:   2021-02-07
categories: tester
cover: /images/2021_02/jekyll_setup.png
author: Craig Oda
license: false
---

![force polling](/webapi/images/2021_02/jekyll_setup.png)

Jekyll works on my Windows 10 system with WSL2 when I add the
`--force-polling` option.

```bash
bundle exec jekyll serve --force-polling
```

When I start Jekyll on WSL2, I get a message that
_Auto-regeneration may not work on some Windows versions_.

Until yesterday, I ignored this because Jekyll was working for me.

However, when I used VS Code from WSL, VS Code complained that I was
using WSL version 1, not WSL2.  I upgraded to WSL2 and Jekyll stopped
working.

The warning from Jekyll provides a link to a
[GitHub issue](https://github.com/Microsoft/BashOnWindows/issues/216) where
other people had the same problem.

I'm not alone.  After digging through different options, I finally found
`--force-polling` from some nice individual.  As I learned from others,
I now pass the solution on to you.

I still need to reload my browser.  However, I don't have to restart Jekyll.
Without `--force-polling`, I needed to restart Jekyll. 

Environment

* jekyll 4.2.0
* WSL 2
* Ubuntu-20.04

```shell
> wsl -l -v
  NAME            STATE           VERSION
* Ubuntu-20.04    Running         2
```

Although I have Ubuntu 20.04 running natively on a separate SSD, I am
running WSL2 on Windows for most development for the following reasons:

* The RICOH official desktop app only runs on Windows or Mac
* Outside of the Linux Streaming Driver applications, almost all developers
on the .guide forum are using Windows or Mac to build mobile apps.  If the
developer is working on a Unity app, it's on Windows.
* I'm running Dart, Flutter, and VS Code natively on Windows and all the tools
seems to work fine. I don't use Python, Ruby, or node natively on Windows.
* I run git natively on Windows and it seems to work okay when I pull
the Dart/Flutter code down to Linux or Mac.

If you have a developer tip, especially an improvement to this technique
or workflow,
please post it in the
[developers lounge](https://community.theta360.guide/c/theta-api-usage/dev-lounge/27) of
the RICOH THETA Developers Forum.
