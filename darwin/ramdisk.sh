#! /bin/bash
NUMSECTORS=2048000
diskutil eraseDisk HFS+ RAMDISK `hdiutil attach -nomount ram://$NUMSECTORS`
ln -sf /VOLUMES/RAMDISK/ /tmp/

