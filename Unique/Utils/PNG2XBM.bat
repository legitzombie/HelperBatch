@echo off

REM  ▄▄▄██▀▀▀▄▄▄       ███▄ ▄███▓▓█████   ██████
REM    ▒██  ▒████▄    ▓██▒▀█▀ ██▒▓█   ▀ ▒██    ▒
REM    ░██  ▒██  ▀█▄  ▓██    ▓██░▒███   ░ ▓██▄
REM ▓██▄██▓ ░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄   ▒   ██▒
REM  ▓███▒   ▓█   ▓██▒▒██▒   ░██▒░▒████▒▒██████▒▒
REM  ▒▓▒▒░   ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░
REM  ▒ ░▒░    ▒   ▒▒ ░░  ░      ░ ░ ░  ░░ ░▒  ░ ░
REM  ░ ░ ░    ░   ▒   ░      ░      ░   ░  ░  ░
REM  ░   ░        ░  ░       ░      ░  ░      ░
REM
REM          ▄▄▄█████▓ ██░ ██ ▓█████
REM          ▓  ██▒ ▓▒▓██░ ██▒▓█   ▀
REM          ▒ ▓██░ ▒░▒██▀▀██░▒███
REM          ░ ▓██▓ ░ ░▓█ ░██ ▒▓█  ▄
REM            ▒██▒ ░ ░▓█▒░██▓░▒████▒
REM            ▒ ░░    ▒ ░░▒░▒░░ ▒░ ░
REM              ░     ▒ ░▒░ ░ ░ ░  ░
REM            ░       ░  ░░ ░   ░
REM                    ░  ░  ░   ░  ░
REM
REM  ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀▓█████  ██▀███
REM ▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ ▓█   ▀ ▓██ ▒ ██▒
REM ▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒███   ▓██ ░▄█ ▒
REM ░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ▒▓█  ▄ ▒██▀▀█▄
REM ░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄░▒████▒░██▓ ▒██▒
REM  ▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░░ ▒░ ░░ ▒▓ ░▒▓░
REM  ▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░ ░ ░  ░  ░▒ ░ ▒░
REM  ░  ░░ ░  ░   ▒   ░        ░ ░░ ░    ░     ░░   ░
REM  ░  ░  ░      ░  ░░ ░      ░  ░      ░  ░   ░
REM  

setlocal

set "script_path=%~dp0"
set "cli_path=%USERPROFILE%\.dotnet\tools\cp77tools.exe"

for %%i in ("%script_path%\..") do set "image_path=%%~fi\temp\raw\base\"
for %%i in ("%script_path%\..") do set "temp_path=%%~fi\temp\archive\base\"

set "image_path=%image_path:\=/%"
if "%image_path:~-1%"=="/" set "image_path=%image_path:~0,-1%"

set "temp_path=%temp_path:\=/%"
if "%temp_path:~-1%"=="/" set "temp_path=%temp_path:~0,-1%"

echo [INFO] Converting pngs to xbm... This can be a slow process...

"%cli_path%" import -p "%image_path%" -o "%temp_path%"



endlocal





