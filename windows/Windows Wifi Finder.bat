cls

@echo off

Title Window's Wifi Password Finder 

NETSH WLAN SHOW PROFILE

pause

ECHO.

ECHO Enter the wifi name:
set /p Var1="> "

NETSH WLAN SHOW PROFILE "%Var1%" Key=clear

@ECHO %RANDOM% %RANDOM% %RANDOM% %RANDOM% %RANDOM% %RANDOM%

pause>nul
