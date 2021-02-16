---
title:  "Installing Mac Binaries"
tags: theta-tester
date:   2021-02-16
categories: tester
cover: https://cdn.pixabay.com/photo/2014/05/02/21/49/laptop-336373_1280.jpg
author: Jesse Casman
license: false
---

If you would like to install the useful command line tool for THETA API developed by Oppkey used in articles like [Using BASH Scripts To Easily Test THETAs](https://community.theta360.guide/t/using-bash-scripts-to-easily-test-thetas/6488) and [Saving HDR _filter Setting to mySetting](https://community.theta360.guide/t/saving-hdr-filter-setting-to-mysetting/6479), please go to:

https://github.com/theta360developers/webapi/releases/tag/v0.1.1-alpha

The registration and the command line tool are free. Binaries are available for Linux, Windows, Mac and Raspberry Pi. Or you can compile the code yourself!

For Mac, I ran into several security steps after downloading the binary. This may not happen to you. @codetricity said he had no problems.

1. I downloaded the Mac binary and unzipped it
2. I had already connected my MacBook Air directly to my THETA Z1. It’s best if you set up two Wi-Fi networks, one to connect to the THETA and one to connect out to the Internet. But it’s not required.
3. From the command line, I tried running a basic command ./theta app --version to test if it’s installed correctly. I got this:

![|414x197](https://lh3.googleusercontent.com/txuMydjymvRhYo1vIgkToWfldYOQASM1_IIcyu182SM6PS4t1apCFax9FmxlIA-40qdfSqyO11fwBq6Rowx256ELN6Hol85YnrFpCLZEzQHbHNaJA8TQ20LiAO_myCiLKTEYri1W)

4. I went in to the Apple menu and System Preferences. Under Security & Privacy, it said that “‘theta’ was blocked from use because it is not from an identified developer.” You can click Allow Anyway.

![|420x362](https://lh5.googleusercontent.com/wDjnRb1e--sC0Fd0Z3EeEpWEPflJKS54kMMatkxgMf0XDEdP0gjPChf3Lfi43hdqnJFinf4NK35x2AdHy1rT68nrte70HPQceYR2rN6H7v85TdVjaafMK_VnDPAQxB3JuxHH3_EM)

5. I tried running it from the command line again. This time, I got the warning:

![|467x211](https://lh6.googleusercontent.com/tshBEQ0VEVfCeEErO5abnMoxbh3RjxVN2orrflR6kQAFnSEs8YsRccvbdSnR2z1h4RCLDPaiPmI0Gt9eVB-H3kr5VipV56sUlts-GKEyp7AibkMNU0iQ0zeFZQ9JjgYc8lk9qp_Q)

6. I clicked Open.
7. I tried running ./theta app --version again. It responded with 0.1.1-alpha. That’s the anticipated response; it works!

![|586x390](https://lh6.googleusercontent.com/tvEoYU60WNL8ApwX9baoeDv6P8xqQCb24xhF1gjX44GKgjZlcyphqzuQZhJ4bpRJjTXJnJRsjaC_cVuH63YuAn35h20-gjKtuPLE53PzABygF1mgEUTi1Xk_bAL_ab2T2neC7vMq)