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
<td bgcolor="#FFFFFF" valign="top"><a href="https://linuxmint.com/">Linux Mint 18 Cinnamon 64-bit</a></td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Development status</td>
<td bgcolor="#FFFFFF" valign="top">Active</td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Version</td>
<td bgcolor="#FFFFFF" valign="top">1.3.1</td>
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
  * [install packages][list_of_tools]
  * remove packages that unnecessary([example][remove_keyring]) or malfunction([example](http://unix.stackexchange.com/questions/215371/linux-network-stops-functioning-after-random-time-wired))
  * configure settings
    * desktop themes
    * fonts
    * [trackball behaveior](mint/doc/trackball.md)
  * dotfiles
* Guest OS setup helper
  * Use of guest machine is a sandbox in order to develop PDE itself.
  * for example, install VMware Tool to enable sharing options
  * VMware Workstation Player and VirtualBox are supported
  * Hypervisor detection. Automatically find witch virtualization software provides current OS then run appropreate script

* Some other tasks expected to be included in provisioner but still in progress, are indicated in [TODO-list](#todo)

## Usase

### Provisioner

1. Install Operating System any of listed above
1. Run command shown below  
**[WARNING]** _This may be cause of Destruction of your environment since the provisioner will run administratively.  
Use disposable machine such as VM_
```
curl https://raw.githubusercontent.com/o2346/pde/master/install | bash -s
```

### <a name="helper">Guest OS setup helper

__on Guest Machine__ , run

```
wget https://raw.githubusercontent.com/o2346/pde/master/install
bash install -v
```

### for development of playbook

Development mode. Checkout Branch "Develop" and play normal playbook
```
curl https://raw.githubusercontent.com/o2346/pde/develop/provision | bash -s - -d
```

Examinational mode. Checkout Branch "Develop" and play for exam( exam.yml will be played instead of normal playbook)
```
curl https://raw.githubusercontent.com/o2346/pde/master/provision | bash -s - -e
```

## Why I made this

* Because I wanted my development environment disposable.
* Every machines may crash unexpectedly. And no time to play with such crap.
  * Totally new one should be brought immediately by extremely easy way
  * No instance dependency
* Nowadays virtualization and auto-deployment tool things are modern technology
  * They do not has to be only for server machines though.
* When my own PC comes with UNIX-like system, why not to do it

## Why Linux instead of Windows/macOS

* Friendly with Infrastructure as Code
* No [Vendor lock-in](https://en.wikipedia.org/wiki/Vendor_lock-in), Proprietary Free
* Run on both [homebuilt computer](https://en.wikipedia.org/wiki/Homebuilt_computer) and VM
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
|[Batch Link Downloader](https://chrome.google.com/webstore/detail/batch-link-downloader/aiahkbnnpafepcgnhhecilboebmmolnn/related)|plugin||
|go to chrome://settings/ and click "Use GTK+ theme".||
|fonts||
|[Un Focus Web Pages](https://chrome.google.com/webstore/detail/un-focus-web-pages/cdbkhgekcjdpnjlajincjjknmbmigifg)||plugin|
|Vimium||plugin|
|adblock||plugin|
|dictionary||plugin|
|translator||plugin|
|[Adblock for Youtube](https://chrome.google.com/webstore/detail/adblock-for-youtube/cmedhionkhpnakcndndgjdbohmhepckk/related?hl=en)||plugin|

### Installation of VMware

* Unfortunately vmware player comes with GUI installer
* download `.bundle` from
  * [player](https://my.vmware.com/jp/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0)
  * [VIX](https://my.vmware.com/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/12_0|PLAYER-1200|drivers_tools)
    * this is for command [`vmrun`](https://communities.vmware.com/thread/521189?start=0&tstart=0) functional
* `sudo sh VMxxxx.bundle` for each `.bundle` files

### others

* screensaver
* power management

brother printer DCP-J137N
https://workshop-of-aruku-web.blogspot.com/2016/06/linux-mint-173.html
https://support.brother.co.jp/j/b/downloadlist.aspx?c=jp&lang=ja&prod=dcpj137n&os=128
https://support.brother.co.jp/j/b/downloadhowto.aspx?c=jp&lang=ja&prod=dcpj137n&os=128&dlid=dlf100889_000&flang=1001&type3=10373

```
cd /tmp
wget https://download.brother.com/welcome/dlf100889/linux-brjprinter-installer-2.2.1-1.gz
gunzip linux-brjprinter-installer-2.2.1-1.gz
sudo bash ./linux-brjprinter-installer-2.2.1-1 DCP-J132
```

### /etc/fstab

configure as necessary

## misc

* [List of Tools][list_of_tools]
* [printer](http://support.brother.co.jp/j/b/downloadhowto.aspx?c=jp&lang=ja&prod=dcpj137n&os=128&dlid=dlf100517_000&flang=1001&type3=561)
  * .deb packages
* [DraftSight](https://www.3ds.com/ja/products-services/draftsight-cad-software/free-download/)

