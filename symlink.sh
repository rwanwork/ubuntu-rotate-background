#!/bin/bash

##  Modify to the location of where all your images are stored
IMAGES_DIR="~/Wallpapers/"

##  Change to the images directory
cd ${IMAGES_DIR}

##  Randomly select a file.  Change the "find" command based on the file
##    extensions that you have used.  If you have more than one file type,
##    you can find everything and then use "grep" to remove everything else.
##    i.e., find ./ -type f -print | grep "jpg$\|JPG$"
fn=`find .jpg -type f -print | shuf | head -n 1`

##  Create a symbolic link to the selected file
ln -s -f ${fn} current.jpg

