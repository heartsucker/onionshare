REM delete old dist files
rmdir /s /q dist

REM build onionshare-gui.exe
pyinstaller install\pyinstaller.spec -y

REM download tor
python install\get-tor-windows.py

REM sign onionshare-gui.exe
signtool.exe sign /v /d "OnionShare" /a /tr http://time.certum.pl/ dist\onionshare\onionshare-gui.exe

REM build an installer, dist\onionshare-setup.exe
makensis.exe install\onionshare.nsi

REM sign onionshare-setup.exe
signtool.exe sign /v /d "OnionShare" /a /tr http://time.certum.pl/ dist\onionshare-setup.exe
