@echo off
setlocal enabledelayedexpansion

set "script_path=%~dp0"

for %%i in ("%script_path%\..") do set "source_path=%%~fi\Wallpapers"
for %%i in ("%script_path%\..") do set "dest_path=%%~fi\temp\images"

REM Create destination folder if it doesn't exist
if not exist "%dest_path%" mkdir "%dest_path%"

set count=0

for %%f in ("%source_path%\*") do (
    set "ext=%%~xf"
    copy "%%f" "%dest_path%\wallpaper_generic-1!ext!" >nul
	copy "%%f" "%dest_path%\wallpaper_generic!ext!" >nul
	copy "%%f" "%dest_path%\wallpaper_maelstorm!ext!" >nul
	copy "%%f" "%dest_path%\wallpaper_militech!ext!" >nul
	copy "%%f" "%dest_path%\wallpaper_konpeki!ext!" >nul
    set /a count+=1
)

endlocal

