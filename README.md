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

## What is this

Automatic provisioning of a Personal Computer like [Server provisioning](https://en.wikipedia.org/wiki/Provisioning#Server_provisioning) as main function.  
Secondary Guest Operating System setup helper. 

* Provisioner
  * [install packages](#list_of_tools)
  * remove packages that unnecessary([example](#remove_keyring)) or malfunction([example](http://unix.stackexchange.com/questions/215371/linux-network-stops-functioning-after-random-time-wired))
  * configure settings
    * desktop themes
    * fonts
    * [trackball behaveior](sarah/doc/trackball.md)
  * dotfiles
* Guest OS setup helper
  * Use of guest machine is a sandbox in order to develop PDE itself.
  * for example, install VMware Tool to enable sharing options
  * VMware Workstation Player and VirtualBox are supported
  * Hypervisor detection. Automatically find witch virtualization software provides current OS then run appropreate script

* Some other tasks expected to be included in provisioner but still in progress, is indicated in [TODO-list](#todo)

## Usase

### Provisoner

1. Install Operating System any of listed above
1. Run command shown below  
**[WARNING]** _This may be cause of Destruction of your environment since the provisioner will run administratively.  
Use disposable machine such as VM_
```
curl https://raw.githubusercontent.com/whateverjp/pde/master/install.sh | bash
```

### Guest OS setup helper

```
wget https://raw.githubusercontent.com/whateverjp/pde/master/install.sh
bash install.sh -v
```

### for development of playbook( Mint 18 Sarah )

Development mode. Checkout Branch "Develop" and play normal playbook
```
wget https://raw.githubusercontent.com/whateverjp/pde/master/install.sh
bash install.sh -d
```

Examinational mode. Checkout Branch "Develop" and play for exam( exam.yml will be played instead of normal playbook)
```
wget https://raw.githubusercontent.com/whateverjp/pde/master/install.sh
bash install.sh -e
```

## Why I made this

* Because I wanted my development environment disposable.
* Every machines may crash unexpectedly. And no time to play with such crap.
  * Totally new one should be brought immediately, reconstructed by Extremely Easy way.
  * no instance dependency
* Nowadays virtualization and auto-deployment tool things are modern technology
  * They do not has to be only for server machines though.
* When my own PC comes with UNIX-like system, why not to do it

## Why Linux instead of Windows/macOS

* Friendly with Infrastructure as Code
* No [Vendor lock-in](https://en.wikipedia.org/wiki/Vendor_lock-in), Proprietary Free
* Run on both homebuilt computer and VM
* UNIX-like
* I'm totally tired of Windows. It suck.
  + No Thanks
  + virtualization is available if needed
* I'm little tired of Mac even if it was better than Windows
  + It forcibly asks like AppleID and password, press "yes" or whatever at every turn such as lisence agreement or upgrade something etc.
  + many popups to force restart or ask something like moron. Annoying
  + AppleID dependency
  + Hardware lock-in

## <a name="todo"> TODO - Tasks requires Manual Operation

The way of automation is not found yet for tasks shown below

### FireFox

|name|kind|discription|
|---|---|---|
|stylish|plugin, darken|https://www.xmisao.com/2014/08/08/dark-firefox.html|
|[Midnight Surfing - Global Dark Style](https://userstyles.org/styles/23516/midnight-surfing-global-dark-style)|stylish-style, darken||
|[vimp](https://www.google.co.jp/search?q=vimperator)|plugin||
|[abyss](https://github.com/revivre/Vimperator/blob/master/colors/abyss.vimp)|vimp style||
|[ft-deepdark](https://addons.mozilla.org/ja/firefox/addon/ft-deepdark/)|firefox theme|darken preferences page|
|ghosty|plugin||
|octotree|plugin||

### Map `` Alt+` `` to Toggle input method

* Sytem Preferenses > Keyboard > Shortcuts > General > Cycle through open windows of the same application > Keyboard Bindings
* Set `` Super+\` ``

[Why do this]  
`Cycle through open windows of the same application` appears as unassigned in GUI by default, but likely mapped into `` Alt+` ``  and conflicts.

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

### chromium

|name|kind|discription|
|---|---|---|
|[Dark Reader](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh)|plugin|Darken pages|
|~~Change Colors~~|plugin|Darken pages|
|Download Master|plugin||

### Installation of VMware

* Unfortunately vmware player comes with GUI installer
* download `.bundle` from
  * [player](https://my.vmware.com/jp/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0)
  * [VIX, to enable `vmrun` ](https://my.vmware.com/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0|PLAYER-1200|drivers_tools)
    * [vmrun missing in the VMware-Player-12.0.0-2985596.x86_64.bundle](https://communities.vmware.com/thread/521189?start=0&tstart=0)
* `sudo sh VMxxxx.bundle` for each `.bundle` files

## misc

* [misc](sarah/doc/misc.md)
* [List of Tools](sarah/doc/misc.md#list_of_tools)

