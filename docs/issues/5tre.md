# #5tre - implementation of macOS

|**Issue**||
|---|---|
|Status|in progress<!-- any of "new", "in progress", "end" http://redmine.jp/tech_note/issue_statuses/ -->|
|Priority|Normal<!-- "high" or "normal" or "low"-->|
|Assignee|owner<!-- your name -->|
|Category|<!-- optional -->|
|Target version|1.3.0<!-- optional, any of git tags recommended -->|
|Start date|2018-04-14|
|Due date|2018-04-24|
|estimated|24hours|
|% Done|60%|
|worked|21hours|

## Description

update playbook for macOS  

## Related to

|**ID**|**Subject**|
|---|---|
|||<!--OTHER_ISSUE;;-->

## History

### procedure

1. initial setup of the macOS
1. make it online
1. full install xcode to avoid macvim installation on brew
  1. __really need__ ?? open xcode in gui, then it updates something
1. register appleid
1. [csrutil disable](https://qiita.com/iwaseasahi/items/9d2e29b02df5cce7285d) to override system vim
1. darken terminal before next execution
1. execute entry point of this sysytem
 1. virtualbox error -> [go sec & privacy](https://github.com/caskroom/homebrew-cask/issues/39369)
1. ssh configurations
1. configurations for each objects
  1. git user & email on global config
  1. iterm2
  1. plugins for firefox
  1. plugins for chrome
  1. [hhkb](http://www.pfu.fujitsu.com/hhkeyboard/macdownload.html)
  1. trackball
  1. magicpad & apple keyborad
  1. auto startup some apps when macOS launched
  1. [link latest vim from brew after installation](https://qiita.com/iwaseasahi/items/a45b99a484966662adbe)
  1. [TODO] w3m extbrowser

---

developed on macbook, prepare testing on clean mac mini

---
*this document has been generated & accessed from computer program, named "icol"*
