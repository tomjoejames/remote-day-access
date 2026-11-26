@echo off
setlocal
rem remote-day: SSH to tom's Mac. This key stops working at 2026-11-26 16:00 IST.
where ssh >nul 2>nul || (echo OpenSSH client not found. Settings - Apps - Optional features - add "OpenSSH Client". & pause & exit /b 1)
set "SRC=%~dp0"
set "WORK=%TEMP%\rd-%RANDOM%%RANDOM%"
mkdir "%WORK%" || goto fail
copy /y "%SRC%day_key" "%WORK%\day_key" >nul || goto fail
copy /y "%SRC%known_hosts" "%WORK%\known_hosts" >nul || goto fail
icacls "%WORK%\day_key" /inheritance:r /grant:r "%USERDOMAIN%\%USERNAME%:R" >nul 2>nul || icacls "%WORK%\day_key" /inheritance:r /grant:r "%USERNAME%:R" >nul || goto fail
cd /d "%WORK%"
ssh -i day_key -o IdentitiesOnly=yes -o IdentityAgent=none -o AddKeysToAgent=no -o ForwardAgent=no -o HostKeyAlias=remote-day-mac -o UserKnownHostsFile=known_hosts -o StrictHostKeyChecking=yes -o UpdateHostKeys=no -o ServerAliveInterval=30 -o ServerAliveCountMax=4 -o ConnectTimeout=20 -p 59301 -t tom@bore.pub remote-day attach
cd /d "%SRC%"
rmdir /s /q "%WORK%"
echo.
echo Disconnected. Temporary key copy deleted. Run connect.cmd again to reconnect.
pause
exit /b 0
:fail
echo Setup failed.
if exist "%WORK%" rmdir /s /q "%WORK%"
pause
exit /b 1
