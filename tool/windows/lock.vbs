Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run("%windir%\System32\rundll32.exe user32.dll,LockWorkStation")