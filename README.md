Rotating Background Image (Ubuntu)
==================================

Overview
--------

This [repository](https://github.com/rwanwork/ubuntu-rotate-background) provides information on how to periodically change the background image for an Ubuntu installation.

The information here has been tested on an Ubuntu 23.04 system.  Whether it works for other versions of Ubuntu is unknown.


Background
----------

There is no shortage of information about this problem.  For example, you may want to search [AskUbuntu](https://askubuntu.com/).

Also, there are programs out there such as:

* [Variety](https://peterlevi.com/variety/)
* [WallCh](https://manpages.ubuntu.com/manpages/kinetic/man1/wallch.1.html)

All of these are viable alternatives.  Here, we merely present one alternative which is able to rotate through images that you have placed in a specific directory (i.e., it does not download new images, which is something Variety does).  It only uses [Cron](https://help.ubuntu.com/community/CronHowto) and a few commands.

Information for this repository was obtained from these two posting on AskUbuntu:

1.  https://askubuntu.com/questions/66914/how-to-change-desktop-background-from-command-line-in-unity
2.  https://askubuntu.com/questions/1022975/why-are-my-wallpaper-settings-tile-zoom-center-scale-fill-or-span-options-n


Prerequisites
-------------

First, place all of the images that you want to show as a background in a specific directory.  Here, we assume you will choose `~/Wallpapers/`.

Then, clone this repository.  In the discussion below, we assume you have cloned it into `~/ubuntu-rotate-background/`.  Actually, only one script is in this repository:  `symlink.sh`.  Modify the path in the script as necessary.


Cron job
--------

Create a `cronjob` that runs this script.  Type `crontab -e` to load the default editor and add the following line, which changes the background image every hour.  Modify the path as necessary.

    @hourly ~/ubuntu-rotate-background/symlink.sh

This example changes the background image every 30 minutes:
    
    */30 * * * * ~/ubuntu-rotate-background/symlink.sh


Gnome Setup
-----------

The last step is to run the following two commands:

    gsettings set org.gnome.desktop.background picture-uri file:///home/rwan/ubuntu-rotate-background/current.jpg
    gsettings set org.gnome.desktop.background picture-uri-dark file:///home/rwan/ubuntu-rotate-background/current.jpg
    
As explained in the above [AskUbuntu](https://askubuntu.com/questions/66914/how-to-change-desktop-background-from-command-line-in-unity) page, you may have set your theme to "Light" or "Dark".  Depending on which one you have set, you need to set a different option.  Running the above commands simply sets both themes to the same image.


Background Image Format
-----------------------

It is possible that the image has been zoomed in when you want it centred, etc.  You can change that on the command-line, as explained [here](https://askubuntu.com/questions/1022975/why-are-my-wallpaper-settings-tile-zoom-center-scale-fill-or-span-options-n).  Alternatively, you can install the `gnome-tweaks` package and use the interface to change how the image is shown.


Copyright and License
---------------------

Copyright (C) 2023 by Raymond Wan (rwan.work@gmail.com)

This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.  Please see the accompanying file, COPYING.v3 for further details.


    Raymond Wan
    2023/06/12

