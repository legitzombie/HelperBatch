@echo off
setlocal

set "script_path=%~dp0"

for %%i in ("%script_path%\..") do set "temp_path=%%~fi\temp"

if not exist "%temp_path%" (
	mkdir "%temp_path%"
	mkdir "%temp_path%\images"
	mkdir "%temp_path%\raw\base\gameplay\gui\world\computers"
	mkdir "%temp_path%\archive\base\gameplay\gui\world\computers"
) 

for %%i in ("%script_path%\..") do set "perm_path=%%~fi\archive\pc\mod"
for %%i in ("%script_path%\..") do set "root_path=%%~fi\archive"

if exist "%root_path%" (
	rmdir /s /q "%root_path%"
)

mkdir "%perm_path%"

endlocal