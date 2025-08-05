@echo off
setlocal enabledelayedexpansion

set "script_path=%~dp0"

for %%i in ("%script_path%\..") do set "source_path=%%~fi\Video"
for %%i in ("%script_path%\..") do set "dest_path=%%~fi\temp\archive\base\movies\fullscreen\logo_splashscreen\"

if not exist "%dest_path%" mkdir "%dest_path%"

set count=0

for %%f in ("%source_path%\*") do (
    set "ext=%%~xf"
    copy "%%f" "%dest_path%cp_bg_alpha_faded!ext!" >nul
    set /a count+=1
)

endlocal

