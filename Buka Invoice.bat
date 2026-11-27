@echo off
setlocal
rem ================================================================
rem  Membuka Invoice Pribadi
rem  dalam jendela aplikasi Microsoft Edge (tanpa bilah alamat).
rem  Selalu buka dengan cara yang sama agar data tetap terlihat.
rem ================================================================
set "APP=%~dp0index.html"
set "URL=file:///%APP:\=/%"
set "AP=SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths"

reg query "HKLM\%AP%\msedge.exe" >nul 2>&1 && goto edge
reg query "HKCU\%AP%\msedge.exe" >nul 2>&1 && goto edge
reg query "HKLM\%AP%\chrome.exe" >nul 2>&1 && goto chrome
reg query "HKCU\%AP%\chrome.exe" >nul 2>&1 && goto chrome
start "" "%APP%"
goto :eof

:edge
start "" msedge --app="%URL%"
goto :eof

:chrome
start "" chrome --app="%URL%"
goto :eof