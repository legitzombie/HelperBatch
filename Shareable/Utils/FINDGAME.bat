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
REM                   ░



setlocal enabledelayedexpansion

set "script_path=%~dp0"
for %%i in ("%script_path%\..") do set "archive_path=%%~fi\archive\pc\mod"

set "defaultSteamPath=%ProgramFiles(x86)%\Steam"
set "libraryFoldersFile=%defaultSteamPath%\steamapps\libraryfolders.vdf"

call :checkSteamFolder "%defaultSteamPath%"
if !errorlevel! == 0 goto :found

if exist "%libraryFoldersFile%" (
    for /f "usebackq tokens=*" %%l in ("%libraryFoldersFile%") do (
        set "line=%%l"
        echo !line! | findstr /i "\"path\"" >nul
        if !errorlevel! == 0 (
            for /f "tokens=2 delims=	" %%a in ("!line!") do (
                set "libPath=%%~a"
                set "libPath=!libPath:"=!"
                set "libPath=!libPath:\\=\!"
                call :checkSteamFolder "!libPath!"
                if !errorlevel! == 0 goto :found
            )
        )
    )
)

set "gogPath=%ProgramFiles(x86)%\GOG Galaxy\Games\Cyberpunk 2077"
call :checkGOGFolder "!gogPath!"
if !errorlevel! == 0 goto :found

echo [ERROR] Could not find Cyberpunk 2077 install in Steam or GOG.
echo [INFO] Please copy the mod files manually to your game folder.
pause
exit /b 1

:checkSteamFolder
set "gamePath=%~1\steamapps\common\Cyberpunk 2077"
if exist "!gamePath!\bin\x64\Cyberpunk2077.exe" (
    set "mod_folder=!gamePath!\archive\pc\mod"
    if not exist "!mod_folder!" (
        mkdir "!mod_folder!"
    )
    xcopy /E /Y /I "%archive_path%\*" "!mod_folder!\" >nul
    echo [INFO] Files copied to Steam path: !mod_folder!
    exit /b 0
)
exit /b 1

:checkGOGFolder
set "gamePath=%~1"
if exist "!gamePath!\bin\x64\Cyberpunk2077.exe" (
    set "mod_folder=!gamePath!\archive\pc\mod"
    if not exist "!mod_folder!" (
        mkdir "!mod_folder!"
    )
    xcopy /E /Y /I "%archive_path%\*" "!mod_folder!\" >nul
    echo [INFO] Files copied to GOG path: !mod_folder!
    exit /b 0
)
exit /b 1

:found
echo [SUCCESS] You can now launch the game.
pause
exit /b 0

