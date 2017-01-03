# PDE

PDE(Personalized Development Environment) is system configration for my work.
"P" in PDE may also stand for _"Provisioner of -"_.

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<th colspan="2" bgcolor="#D0CDCD" align="center"><big>Personalized Development Environment</big></th>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Purpose</td>
<td bgcolor="#FFFFFF" valign="top">Desktop, Software Development</td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Operating system</td>
<td bgcolor="#FFFFFF" valign="top"><a href="http://www.linuxmint.com/rel_sarah_cinnamon.php">Linux Mint 18 Cinnamon 64-bit</a></td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Development status</td>
<td bgcolor="#FFFFFF" valign="top">Active</td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Version</td>
<td bgcolor="#FFFFFF" valign="top">1.0.1</td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Written in</td>
<td bgcolor="#FFFFFF" valign="top">Shellscript, <a href="http://docs.ansible.com/ansible/index.html">Ansible</a></td>
</tr>
</table>

## Usase

1. Cleanly install Operating System any of shown above
1. Run command shown below  
**[WARNING]** _This may be cause of Destruction of your environment since the provisioner will run administratively.  
Use disposable machine such as VM_
```
curl https://raw.githubusercontent.com/whateverjp/pde/master/install.sh | bash
```

## Why I made this

* Because I wanted my Development Environment disposable.
* Every machines may crash unexpectedly. And no time to play with such crap.
  * Totally new one should be brought immediately, reconstructed by Extremely Easy way.
  * NO instance dependency
* Nowadays VMs, auto-deployment tools are modern technology
  * They do not has to be only for server machines though.
* When my own PC comes with UNIX-like system, why not to do it.

## Why Linux

* Run on homebuilt computer
* No [Vendor lock-in](https://en.wikipedia.org/wiki/Vendor_lock-in), Proprietary Free
* Easy to switch Dark theme of Desktop
  * Bright background colors are too hard for eyes
* Friendly for Infrastructure as Code
* Can be sandbox on VM
* I'm totally tired of Windows. It suck.
  + No Thanks
  + virtualization is available if needed
* I'm little tired of Mac also even if it was better than Windows.
  + It forcibly asks like AppleID and password, "yes" or whatever at every turn such as lisence agreement or upgrade something etc.
  + AppleID dependency
  + Hardware lock-in

## TODO After Provisioning

The way of automation is not found yet for tasks shown below

### FireFox

|name|kind|discription|
|---|---|---|
|stylish|plugin, darken|https://www.xmisao.com/2014/08/08/dark-firefox.html|
|Midnight Surfing - Global Dark Style|stylish-style, darken|https://userstyles.org/styles/23516/midnight-surfing-global-dark-style|
|dark theme|theme, darken|find any|
|vimp|plugin||
|abyss|vimp style|provisioner included|
|[ft-deepdark](https://addons.mozilla.org/ja/firefox/addon/ft-deepdark/)|firefox theme|darken preferences page|
|ghosty|plugin||
|octotree|plugin||

### Map `` Alt+` `` to Toggle input method

* Sytem Preferenses > Keyboard > Shortcuts > General > Cycle through open windows of the same application > Keyboard Bindings
* Set `` Super+\` ``

[Why do this]  
`Cycle through open windows of the same application` appears as unassigned by default, but likely mapped into `` Alt+` ``  and conflicts.

### fcitx/Mozc

```
Right Click Keyboard icon in taskbar > Configure > Input Method > + > mozc
Right Click Keyboard icon in taskbar > Configure > Global Config > Trigger Input Method > Alt+`
```

### Gnome Terminal

```
File Menu > Edit > Preferenses > Enable nmemonics on
File Menu > Edit > Profile Preferenses > [As I like]
```

### chrome

|name|kind|discription|
|---|---|---|
|Change Colors|plugin||
|Download Master|plugin||

## How to Get rid of the login keyring password

https://community.linuxmint.com/tutorial/view/916

* The instruction shown above requires GUI unfortunately
* For Substitution,
  * `sudo apt remove gnome-keyring`
  * Already written in playbook and it works

### VMware

* Unfortunately vmware player comes with GUI installer
* download `.bundle` from
  * https://my.vmware.com/jp/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0
    * main application
  * https://my.vmware.com/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0|PLAYER-1200|drivers_tools
    * SDK for enable `vmrun` command
      *https://communities.vmware.com/thread/521189?start=0&tstart=0
* run `sudo sh VMxxxx.bundle`

#### Start VM over CUI

* `vmrun -T player start /path/vm.vmx`
  * http://askubuntu.com/questions/342552/vmware-vix-vmrun-command-error-unable-to-connect-to-host-version-not-found

### virtualbox

#### Installation

* Included in provisioner

#### Start VM over CUI

* `virtualbox startvm /path/hoge.vbox`

#### Enable Shared Folder and clipboard on guest Mint

1. Menu > VMWare Tools someting
1. Installer will be shown in guest
1. Extract VMwareTools.x.x.x-xxxx.tar.gz to someware
1. Directory `vmware-tools-distrib` will appear
1. `cd /pathto/vmware-tools-distrib`
1. `sudo ./vmware-install.pl -d`
1. `sudo apt -y install open-vm-tools`
1. `sudo apt -y install open-vm-tools-desktop`
1. `sudo shutdown -r now`

## Slimblade Trackball Configration

Already included in provisioning, just for note below

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

## How to Get rid of the login keyring password

https://community.linuxmint.com/tutorial/view/916

* The instruction shown above requires GUI unfortunately
* For Substitution,
  * `sudo apt remove gnome-keyring`
  * Already written in playbook and it works

## List of Tools

|Name|Kind|Misc|
|----|----|----|
|apt||Sites located in Japan are listed as closer ones on @sources.list@|
|git|||
|ansible|||
|vim|||
|emacs|||
|node.js|||
|awscli|||
|htop|||
|nkf|||
|tmux|||
|virtualbox|||
|filezilla|||
|keepassx|||
|vlc|||
|zsh|||
|chromium|||
|vagrant|||
|ffmpeg|||
|wine|||
|fontforge|||
|NeoBundle|||
|vmware|||
|mp3splt|||
|imageMagick||installed|
|dotfiles||original|
|whois|||
|~~sysv-rc-conf~~|||
|~~diff-pdf~~|||
|~~reattach-to-user-namespace~~|||
|~~chrome~~||chromium|
|~~dropbox~~|||
|~~skitch~~|||
|~~google-japanese-ime~~||mozc|
|~~sourcetree~~||no Linux version|
|~~p4merge~~|||
|~~diffmerge~~|||
|~~macdown~~|||
|~~atom~~|||

## Customizing System Themes and Fonts

* Provisioner Included

## Usase for development of playbook( Mint 18 Sarah )

Development mode. Checkout Branch "Develop" and play normal playbook
```
wget https://raw.githubusercontent.com/whateverjp/pde/master/install.sh
bash install.sh -d
```

Examinational mode. Checkout Branch "Develop" and play for exam( exam.yml will be played)
```
wget https://raw.githubusercontent.com/whateverjp/pde/master/install.sh
bash install.sh -e
```

## Thanks to

* [Ubuntu Sources List Generator](https://repogen.simplylinux.ch/)
* [gsettings sample](https://github.com/teofilcojocariu/Linux-Mint-17-Init/blob/master/run/4-user.sh)
* [How do I restart Cinnamon from the tty?](http://askubuntu.com/questions/143838/how-do-i-restart-cinnamon-from-the-tty)

