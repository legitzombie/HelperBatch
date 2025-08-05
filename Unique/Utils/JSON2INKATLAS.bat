@echo off
setlocal

set "script_path=%~dp0"
set "cli_path=%USERPROFILE%\.dotnet\tools\cp77tools.exe"

for %%i in ("%script_path%\..") do set "wallpaper_path=%%~fi\temp\raw\base\gameplay\gui\world\computers"
for %%i in ("%script_path%\..") do set "temp_path=%%~fi\temp\archive\base\gameplay\gui\world\computers"

set "json_file=%wallpaper_path%\wallpapers.inkatlas.json"

if exist "%json_file%" (

    %cli_path% convert d "%json_file%"

	for %%F in ("%wallpaper_path%\*") do (
		if /I "%%~nxF"=="wallpapers.inkatlas" (
			move /Y "%%F" "%temp_path%\%%~nxF"
		)
	)
)

endlocal
