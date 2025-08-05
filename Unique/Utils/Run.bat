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

color 0D
set "PATH=%SystemRoot%\System32;%PATH%"

call Utils/GETHELPERS.bat

call Utils/GETREDIST.bat

call Utils/GETDOTNET.bat

if %errorlevel%==123 exit

call Utils/GETCLI.bat



call Utils/CREATEFOLDERS.bat



call Utils/ARCHIVE.bat

call Utils/CLEANUP.bat

call Utils/FINDGAME.bat

endlocal