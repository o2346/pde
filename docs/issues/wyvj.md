# #wyvj - ssh problem: warning: setlocale: LC_CTYPE....

|**Issue**||
|---|---|
|Status|New<!-- any of "new", "in progress", "end" http://redmine.jp/tech_note/issue_statuses/ -->|
|Priority|Normal<!-- "high" or "normal" or "low"-->|
|Assignee|owner<!-- your name -->|
|Category|<!-- optional -->|
|Target version|<!-- optional, any of git tags recommended -->|
|Start date|2018-08-15|
|Due date|2018-08-31|
|estimated|2hours|
|% Done|10%|
|worked|1hours|

## Description

Using terminal ssh to my Linux servers I have always got the following error:
` warning: setlocale: LC_CTYPE: cannot change locale (UTF-8): No such file or directory`

http://eduroll.eu/?p=119

この問題のため接続先サーバ上の vim で日本語が文字化けし、正常に表示されない。
解決策もリンク先にあり、これを playbook に適用すること

## Related to

|**ID**|**Subject**|
|---|---|
|||<!--OTHER_ISSUE;;-->

## History

---
*this document has been generated & accessed from computer program, named "icol"*
