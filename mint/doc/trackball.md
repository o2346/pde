# <a name="trackball"> Slimblade Trackball Configration on Linux Mint18 Sarah

* check behaveior of devices
```
xev
```

* by checking on xev, default button mapping was found as shown below
```
2|8
-o-
1|3
```

* `1` for Left click, `3` for Right click. Not sure how north side buttons `2` and `8` are mapped.
* `4` for Counter-clockwise, `5` for Clockwise on the ball.

* get current status
```
xinput get-button-map "Kensington Kensington Slimblade Trackball"
```

* default order is likely `1 2 3 4 . . . 12` according to command above

* set for Right handed and same action on North buttons
```
xinput set-button-map "Kensington Kensington Slimblade Trackball" 1 1 3 4 5 6 7 3 9 10 11 12
```

* then mapping should be as shown below
```
1|3
-o-
1|3
```

* set for Left handed and reverse scroll wheel ( This is my standard )
```
xinput set-button-map "Kensington Kensington Slimblade Trackball" 3 3 1 5 4 6 7 1 9 10 11 12
```

* then mapping should be as shown below
```
3|1
-o-
3|1
```

* make slower mouse pointer. Default is too fast
```
xinput --set-prop "Kensington Kensington Slimblade Trackball" "Device Accel Constant Deceleration" 4
```
  * http://superuser.com/questions/864646/how-to-make-the-mouse-movement-slower-in-linux-mint-rebecca

* note:
  * Configration of the button-map will reset to default on every reboot.
  * Unfortunately crontab does not work anyway.
  * Therefore, `~/.config/autostart/trackball.desktop` was defined
  * The mapping will reset when SlimBlade unplugged and need to reload custom map at reconnected.
    * Specified shellscript seemingly can be called from udev but @xinput@ unfunctional on the script
    * Sorry but manually run script located at @/usr/local/bin/trackball.sh@ every time for now

* thanks to
  * [Thread: Slimblade Trackball mouse configuration problem](https://ubuntuforums.org/showthread.php?t=1325968)
  * [UbuntuでKensington SlimBlade Trackballのボタン設定を変える](http://camellia.thyme.jp/blog/)
  * http://askubuntu.com/questions/598195/how-to-add-a-script-to-startup-applications-from-the-command-line
  * http://unix.stackexchange.com/questions/255875/how-to-start-cron-in-linux-mint-17-3
  * https://ubuntuforums.org/showthread.php?t=1530652
  * http://askubuntu.com/questions/457815/how-can-i-run-a-sh-script-targeting-x11-settings-on-login
  * https://www.xmisao.com/2013/04/24/cron-reboot-implementations.html

