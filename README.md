# PDE

PDE(Provision Development Environment) is system configration for local development machine(s) dedicated for **me**.

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<th colspan="2" bgcolor="#D0CDCD" align="center"><big>Provision Development Environment</big></th>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Purpose</td>
<td bgcolor="#FFFFFF" valign="top">Provision Unix-like machine for Personal use</td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Operating system</td>
<td bgcolor="#FFFFFF" valign="top"><a href="https://linuxmint.com/">Linux Mint 20</a></td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Development status</td>
<td bgcolor="#FFFFFF" valign="top">Active</td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Version</td>
<td bgcolor="#FFFFFF" valign="top">2.0.0</td>
</tr>
<tr>
<th bgcolor="#D0CDCD" align="left" nowrap>Written in</td>
<td bgcolor="#FFFFFF" valign="top">Shellscript, <a href="http://docs.ansible.com/ansible/index.html">Ansible</a></td>
</tr>
</table>

## What is this

Configuration code like [Server provisioning](https://en.wikipedia.org/wiki/Provisioning#Server_provisioning), but this is for homebuild computer, or laptop I own.

* ./provision
  * entry point
* debian/install.yml
  * Install packages(apt or other way)
  * Remove unnecessary packages
  * configure settings

## Usase

1. Install supported Operating System
1. Run command shown below  
**[WARNING]** _This might cause of Destruction of your environment since it will run administratively. Use disposable machine such as VM_

```
curl https://raw.githubusercontent.com/o2346/pde/master/provision | bash -s
```

### Provision with playbook on the develop branch instead of master

```
curl https://raw.githubusercontent.com/o2346/pde/develop/provision | bash -s - -d
```

with playbook `exam.yml` for experiment other than default

```
curl https://raw.githubusercontent.com/o2346/pde/develop/provision | bash -s - -e
```

## Intention

local environment as code

* I wanted mine disposable and reproducible
  * Even among separate machines. Not to depend on a specific one
  * Individuals may sometime crash unexpectedly
  * In such case no time to play with such crap
  * Replace with complete new one by minimized effort instead

## <a name="todo"> TODO - Tasks requires Manual Operation

Desired automation is not found yet for tasks shown below

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

configure if necessary

## misc

* [printer](http://support.brother.co.jp/j/b/downloadhowto.aspx?c=jp&lang=ja&prod=dcpj137n&os=128&dlid=dlf100517_000&flang=1001&type3=561)
  * .deb packages

