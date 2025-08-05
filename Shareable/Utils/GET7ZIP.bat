@echo off
setlocal enabledelayedexpansion

set "runbat=%~dp0..\Run.bat"
set "PATH=%SystemRoot%\System32;%PATH%"

set "ZIP_URL=https://www.7-zip.org/a/7z2301-x64.exe"
set "ZIP_INSTALLER=7z2301-x64.exe"
set "SEVENZIP_PATH=C:\Program Files\7-Zip"
set "SEVENZIP_EXE=%SEVENZIP_PATH%\7z.exe"

if exist "%SEVENZIP_EXE%" (
    goto :done
)

echo Downloading 7-Zip...
curl -L -o "%ZIP_INSTALLER%" "%ZIP_URL%"

if not exist "%ZIP_INSTALLER%" (
    echo Failed to download 7-Zip installer.
    exit /b 1
)

echo Installing 7-Zip...
"%ZIP_INSTALLER%" /S

if exist "%SEVENZIP_EXE%" (
    echo 7-Zip installed successfully.
) else (
    echo 7-Zip may not have installed correctly.
)

del "%ZIP_INSTALLER%"

:done
exit /b 0
endlocal
